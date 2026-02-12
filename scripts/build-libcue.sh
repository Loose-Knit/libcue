#!/usr/bin/env bash
set -euo pipefail

PKG="libcue-${GOOS}-${GOARCH}"

case "$GOOS" in
  linux) EXT="so" ;;
  darwin) EXT="dylib" ;;
  windows) EXT="dll" ;;
  *) echo "Unsupported GOOS: $GOOS"; exit 1 ;;
esac

echo "Building $PKG.$EXT"

go build -buildmode=c-shared -o "${PKG}.${EXT}"
