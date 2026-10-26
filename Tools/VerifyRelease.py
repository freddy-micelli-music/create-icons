#!/usr/bin/env python3
"""Validate the packaged macOS application using only the Python standard library."""
import ast
import hashlib
from pathlib import Path
import plistlib
import re
import struct
import subprocess
import zipfile

root = Path(__file__).resolve().parents[1]
app = root / 'build' / 'Create Icons.app'
contents = app / 'Contents'
source_info = plistlib.loads((root / 'Info.plist').read_bytes())
built_info = plistlib.loads((contents / 'Info.plist').read_bytes())
assert source_info == built_info, 'Built Info.plist differs from the source'
version = built_info['CFBundleShortVersionString']
assert re.fullmatch(r'\d+\.\d+\.\d+', version), 'Invalid release version'
assert built_info['LSMinimumSystemVersion'] == '14.0'
binary = contents / 'MacOS' / built_info['CFBundleExecutable']
architectures = subprocess.check_output(['xcrun', 'lipo', '-archs', str(binary)], text=True).split()
assert set(architectures) == {'arm64', 'x86_64'}, architectures
subprocess.run(['codesign', '--verify', '--deep', '--strict', str(app)], check=True)

source = (root / 'Sources' / 'CreateIcons.swift').read_text()
styles = ast.literal_eval(re.search(r'^let styles = (\[.*\])$', source, re.M).group(1))
for style in styles:
    image = contents / 'Resources' / 'StylePreviews' / (style + '.png')
    header = image.read_bytes()[:24]
    assert header[:8] == b'\x89PNG\r\n\x1a\n', f'Invalid preview: {style}'
    assert struct.unpack('>II', header[16:24]) == (128, 128), style
for name in ['AppIcon.icns', 'Credits.rtf']:
    assert (contents / 'Resources' / name).read_bytes() == (root / 'Resources' / name).read_bytes(), name
credits = subprocess.check_output(['textutil', '-convert', 'html', '-stdout', str(contents / 'Resources' / 'Credits.rtf')], text=True)
assert 'mailto:contact@seeview-pro.com' in credits and 'Email :' in credits

archive = root / 'build' / 'Create Icons.zip'
with zipfile.ZipFile(archive) as package:
    assert package.testzip() is None
    names = set(package.namelist())
    assert 'Create Icons.app/Contents/MacOS/Create Icons' in names
    for style in styles:
        assert f'Create Icons.app/Contents/Resources/StylePreviews/{style}.png' in names
print(f'PASS: Create Icons {version}, universal, signature, {len(styles)} previews, credits and ZIP')
print('SHA-256:', hashlib.sha256(archive.read_bytes()).hexdigest())
