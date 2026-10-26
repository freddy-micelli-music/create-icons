#!/usr/bin/env python3
"""Regenerate startup previews from the production renderer and bundled example image."""
from pathlib import Path
import platform
import subprocess

root = Path(__file__).resolve().parents[1]
build = root / 'build'
build.mkdir(exist_ok=True)
source = (root / 'Sources' / 'CreateIcons.swift').read_text()
core = source[:source.index('@main struct CreateIconsApp:App')]
harness = r'''
@main struct GenerateStylePreviews {
 static func main() throws {
  let root=URL(fileURLWithPath:CommandLine.arguments[1])
  guard let source=NSImage(contentsOf:root.appendingPathComponent("Resources/AppIcon-source.png")) else { fatalError("Example image is missing") }
  let folder=root.appendingPathComponent("Resources/StylePreviews")
  try FileManager.default.createDirectory(at:folder,withIntermediateDirectories:true)
  for style in styles { try png(render(source,style:style,settings:Settings()),size:128).write(to:folder.appendingPathComponent(style+".png")) }
  print("Generated \(styles.count) startup previews")
 }
}
'''
script = build / 'GenerateStylePreviews.swift'
script.write_text(core + harness)
binary = build / 'GenerateStylePreviews'
architecture = platform.machine()
assert architecture in ('arm64', 'x86_64'), architecture
subprocess.run(['xcrun', 'swiftc', str(script), '-parse-as-library', '-o', str(binary), '-framework', 'SwiftUI', '-framework', 'AppKit', '-framework', 'Vision', '-target', f'{architecture}-apple-macosx14.0', '-module-cache-path', str(build / 'ModuleCache')], check=True)
subprocess.run([str(binary), str(root)], check=True)
