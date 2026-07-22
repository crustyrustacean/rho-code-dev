# rho-code.dev

The official landing page for [rho](https://github.com/crustyrustacean/rho-coding-agent), an AI-powered coding agent built for Rust developers.

## About

This repository contains the source code for the [rho-code.dev](https://rho-code.dev) website, built using [Taxus](https://codeberg.org/crustyrustacean/taxus) static site generator.

## Development

### Prerequisites

- [Taxus](https://github.com/crustyrustacean/taxus) static site generator

Install Taxus:
```bash
cargo install --git https://codeberg.org/crustyrustacean/taxus.git taxus
```

### Local Development

1. Clone this repository:
   ```bash
   git clone https://github.com/your-username/rho-code-dev.git
   cd rho-code-dev
   ```

2. Build the site:
   ```bash
   taxus build
   ```

3. Serve locally with hot reload:
   ```bash
   taxus serve --open
   ```

The site will be available at `http://localhost:3000` by default.

### Project Structure

```
├── content/          # Markdown content files
│   └── _index.md     # Homepage content
├── templates/        # Tera HTML templates
│   ├── base.html     # Base template
│   └── section.html  # Section template
├── styles/           # SCSS stylesheets
│   └── main.scss     # Main stylesheet
├── static/           # Static assets
│   ├── favicon.png   # Site favicon
│   └── scripts.js    # JavaScript files
├── dist/             # Built site (generated)
└── site.toml         # Site configuration
```

### Building

To build the site for production:

```bash
taxus build
```

The generated site will be in the `dist/` directory, ready for deployment.

## Deployment

The site is designed to be deployed to any static hosting service. The built files in `dist/` contain everything needed.

### Cloudflare Pages

The site is configured for [Cloudflare Pages](https://pages.cloudflare.com/) deployment.

#### Manual deployment

```bash
./deploy.ps1
```

You'll need a Cloudflare API token with Pages permissions:
- If you have `CLOUDFLARE_API_TOKEN` and `CLOUDFLARE_ACCOUNT_ID` set as environment variables, it will use those.
- Otherwise, run `npx wrangler login` first to authenticate interactively.

#### Automated (GitHub Actions)

On every push to `trunk`, [the CI workflow](.github/workflows/deploy.yml) builds the site and deploys it automatically. To set this up:

1. Go to your repo **Settings → Secrets and variables → Actions**
2. Add these repository secrets:
   - `CLOUDFLARE_API_TOKEN` — a Cloudflare API token with **Cloudflare Pages:Edit** permission
   - `CLOUDFLARE_ACCOUNT_ID` — your Cloudflare account ID (find it in the Cloudflare Dashboard)
3. Push to `trunk` — the action will deploy automatically.

> **Note:** The first deployment creates a `rho-code-dev` project in Cloudflare Pages.
> Go to **Cloudflare Dashboard → Workers & Pages → rho-code-dev** to set your custom domain (`rho-code.dev`).

## About rho

rho is a local AI coding agent that helps developers build software, with a focus on Rust development. Key features include:

- **Understands Your Code**: Reads files, runs tests, and fixes errors with full project context
- **Rust-First Experience**: Deep integration with `cargo`, compiler diagnostics, and the Rust ecosystem
- **Runs Locally**: No cloud dependencies, complete privacy protection
- **File Operations**: Precise file reading, writing, and editing
- **Compiler Integration**: Parses `cargo check` output and applies fixes automatically
- **Test-Driven Development**: Runs tests and diagnoses failures

## Links

- **Main Project**: [rho-coding-agent](https://github.com/crustyrustacean/rho-coding-agent)
- **Documentation**: [crustyrustacean.github.io/rho-coding-agent](https://crustyrustacean.github.io/rho-coding-agent)
- **Website**: [rho-code.dev](https://rho-code.dev)
- **Taxus SSG**: [codeberg.org/crustyrustacean/taxus](https://codeberg.org/crustyrustacean/taxus)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.