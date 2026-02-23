#!/usr/bin/env bash
set -e

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIST="${ROOT}/dist"

rm -rf "$DIST"
mkdir -p "$DIST"

# Copy design system CSS
cp "${ROOT}/design-system.css" "$DIST/"

# Build index.html from element-library with correct paths.
# Use a relative <base href="." /> so the same build works both:
# - locally (e.g. serve from dist/ or open index.html) and
# - under a subpath (e.g. example.com/design-system/).
sed -e 's|href="../design-system.css"|href="design-system.css"|' \
    -e '/<p><a href="index.html">← Back to examples<\/a><\/p>/d' \
    -e '/<meta name="viewport" content="width=device-width, initial-scale=1.0" \/>/a\
  <base href="." />' \
    "${ROOT}/examples/element-library.html" > "$DIST/index.html"

echo "Built to dist/"
