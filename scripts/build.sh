#!/usr/bin/env bash
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIST="${ROOT}/dist"

rm -rf "$DIST"
mkdir -p "$DIST"

# Copy design system CSS
cp "${ROOT}/design-system.css" "$DIST/"

# Build index.html from element-library with correct paths
sed -e 's|href="../design-system.css"|href="design-system.css"|' \
    -e '/<p><a href="index.html">← Back to examples<\/a><\/p>/d' \
    "${ROOT}/examples/element-library.html" > "$DIST/index.html"

echo "Built to dist/"
