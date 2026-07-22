# Cloudflare Pages Deployment for taxus Sites

## Template — Copy this to any taxus site repo

### 1. `wrangler.toml`
```toml
name = "YOUR_PROJECT_NAME"
pages_build_output_dir = "dist"
```

### 2. `.github/workflows/deploy.yml`
```yaml
name: Deploy to Cloudflare Pages

on:
  push:
    branches: [trunk]
  workflow_dispatch:

jobs:
  build-and-deploy:
    runs-on: ubuntu-22.04
    permissions:
      contents: read
      deployments: write
    steps:
      - uses: actions/checkout@v4
      - uses: dtolnay/rust-toolchain@stable
      - uses: Swatinem/rust-cache@v2
      - run: rustup target add wasm32-unknown-unknown
      - run: cargo install --git https://codeberg.org/crustyrustacean/taxus.git taxus
      - run: taxus build
      - name: Create Cloudflare Pages project (if needed)
        run: |
          npx wrangler pages project create YOUR_PROJECT_NAME --production-branch trunk || echo "already exists"
        env:
          CLOUDFLARE_API_TOKEN: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          CLOUDFLARE_ACCOUNT_ID: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}
      - name: Deploy to Cloudflare Pages
        run: npx wrangler pages deploy dist/ --project-name=YOUR_PROJECT_NAME --branch=${{ github.ref_name }}
        env:
          CLOUDFLARE_API_TOKEN: ${{ secrets.CLOUDFLARE_API_TOKEN }}
          CLOUDFLARE_ACCOUNT_ID: ${{ secrets.CLOUDFLARE_ACCOUNT_ID }}
```

### 3. GitHub Secrets (repository secrets)
- `CLOUDFLARE_API_TOKEN` — Cloudflare API token with Pages:Edit permission
- `CLOUDFLARE_ACCOUNT_ID` — Cloudflare account ID

### Notes
- taxus repo: `https://codeberg.org/crustyrustacean/taxus.git`
- Build output: `dist/`
- Avoid `cloudflare/wrangler-action@v3` (deprecated); use `npx wrangler` directly
- First deploy auto-creates the Pages project; add custom domain in Cloudflare Dashboard after