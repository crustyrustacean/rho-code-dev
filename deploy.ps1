#!/usr/bin/env pwsh
<#
.SYNOPSIS
  Deploy rho-code.dev to Cloudflare Pages.
.DESCRIPTION
  Builds the site with taxus and deploys the dist/ directory to Cloudflare Pages.
  Requires CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID environment variables,
  or an authenticated wrangler session (wrangler login).
#>

$ErrorActionPreference = "Stop"

# ── Build ──────────────────────────────────────────────────────────────
Write-Host "==> Building site with taxus..." -ForegroundColor Cyan
taxus build
if ($LASTEXITCODE -ne 0) {
    Write-Error "Build failed."
    exit 1
}

# ── Deploy ─────────────────────────────────────────────────────────────
Write-Host "==> Deploying to Cloudflare Pages..." -ForegroundColor Cyan
npx wrangler pages deploy dist/ --project-name=rho-code-dev
if ($LASTEXITCODE -ne 0) {
    Write-Error "Deploy failed."
    exit 1
}

Write-Host "==> Done! Site deployed to https://rho-code.dev" -ForegroundColor Green