#!/bin/zsh
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p build/ModuleCache 'build/Create Icons.app/Contents/MacOS' 'build/Create Icons.app/Contents/Resources'
for arch in arm64 x86_64; do
 xcrun swiftc Sources/CreateIcons.swift -parse-as-library -O -o "build/CreateIcons-$arch" -framework SwiftUI -framework AppKit -framework Vision -target "$arch-apple-macosx14.0" -module-cache-path build/ModuleCache
done
xcrun lipo -create build/CreateIcons-arm64 build/CreateIcons-x86_64 -output 'build/Create Icons.app/Contents/MacOS/Create Icons'
cp Info.plist 'build/Create Icons.app/Contents/'
cp Resources/AppIcon.icns 'build/Create Icons.app/Contents/Resources/'
cp Resources/Credits.rtf 'build/Create Icons.app/Contents/Resources/'
ditto Resources/StylePreviews 'build/Create Icons.app/Contents/Resources/StylePreviews'
codesign --force --deep --sign - 'build/Create Icons.app'
codesign --verify --deep --strict 'build/Create Icons.app'
ditto -c -k --sequesterRsrc --keepParent 'build/Create Icons.app' 'build/Create Icons.zip'
echo 'Application disponible dans build/Create Icons.app'
