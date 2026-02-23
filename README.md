# TUI Design System

High-contrast retro terminal aesthetic. Single drop-in CSS file.

## Usage

1. Link the stylesheet in your project:
   ```html
   <link rel="stylesheet" href="design-system.css" />
   ```
2. Add the `tui` class to `<body>` (or `html`):
   ```html
   <body class="tui">
   ```
   Or via JavaScript: `document.body.classList.add('tui');`

## Design Tokens (CSS Variables)

Override in your project without editing the design system:

### Colors
- `--tui-bg` – background
- `--tui-fg` – foreground text
- `--tui-muted` – secondary text
- `--tui-line`, `--tui-line-strong` – borders
- `--tui-pink`, `--tui-cyan` – accents
- `--tui-danger`, `--tui-ok` – states

### Spacing
- `--tui-pad-1`, `--tui-pad-2`, `--tui-pad-3`
- `--tui-gap`, `--tui-gap-sm`, `--tui-gap-lg`

### Layout (size/position overrides)
- `--tui-modal-width`, `--tui-modal-max-height`
- `--tui-panel-width`, `--tui-panel-padding`
- `--tui-controls-area-bg` – semi-transparent background (default: `rgba(0, 0, 0, 0.3)`)
- `--tui-controls-surface-bg` – opaque background for buttons, inputs, list items inside controls (default: `rgba(0, 0, 0, 0.9)`)
- `--tui-controls-area-width` – width for left overlay (default: `320px`)
- `--tui-controls-area-max-height` – max height for bottom overlay (default: `50vh`)
- `--tui-button-padding-x`, `--tui-button-padding-y`
- `--tui-input-padding-x`, `--tui-input-padding-y`
- `--tui-input-width`
- `--tui-scrollbar-size`, `--tui-checkbox-size`, `--tui-range-thumb-size`

### Typography
- `--tui-font` – primary font is Iosevka (loaded via [Fontsource](https://fontsource.org/fonts/iosevka) / jsDelivr); fallbacks: ui-monospace, Menlo, etc.
- `--tui-font-size`, `--tui-font-size-sm`, `--tui-font-size-lg`
- `--tui-letter-spacing`

### Borders
- `--tui-bw`, `--tui-radius`

## Deploying to your domain (S3 + Route 53)

The workflow in `.github/workflows/deploy.yml` builds and syncs the site to S3 under the `design-system/` prefix so it can be served at e.g. **ragtagthrone.com/design-system**.

**Required repository secrets** (Settings → Secrets and variables → Actions):

| Secret | Description |
|--------|-------------|
| `AWS_ACCESS_KEY_ID` | IAM user with `s3:PutObject`, `s3:DeleteObject` on the bucket |
| `AWS_SECRET_ACCESS_KEY` | Corresponding secret key |
| `AWS_S3_BUCKET` | Bucket that backs your site (same bucket as the rest of ragtagthrone.com) |
| `AWS_REGION` | Optional; defaults to `us-east-1` |
| `CLOUDFRONT_DISTRIBUTION_ID` | Optional; if set, triggers a cache invalidation for `/design-system/*` after upload |

Ensure the bucket (or CloudFront origin) is the one your Route 53 domain points to. The workflow uploads `dist/` into the **design-system/** prefix, so the app is available at `https://ragtagthrone.com/design-system/`.

## Deploying under a subpath (manual)

To serve the app at a route like `example.com/design-system` without using the S3 workflow:

1. Run `./scripts/build.sh`.
2. Copy the contents of `dist/` into your main site’s `design-system/` directory, then deploy the main site.

The build uses a relative `<base href="." />`, so the same `dist/` works when served from the root (e.g. local dev) and when served under a subpath.

## Examples

Static, non-functional example UIs are in `examples/`:

- `examples/art-grid-style.html` – left-side collapsible panel + canvas
- `examples/brush-editor-style.html` – header + viewport + bottom panel + modal

Open `examples/index.html` to navigate.
