# rho-code.dev

The official landing page for [rho](https://github.com/crustyrustacean/rho-coding-agent), an AI-powered coding agent built for Rust developers.

## About

This repository contains the source code for the [rho-code.dev](https://rho-code.dev) website, built using [Taxus](https://github.com/crustyrustacean/taxus) static site generator.

## Development

### Prerequisites

- [Taxus](https://github.com/crustyrustacean/taxus) static site generator

Install Taxus:
```bash
cargo install --git https://github.com/crustyrustacean/taxus.git taxus
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
- **Taxus SSG**: [github.com/crustyrustacean/taxus](https://github.com/crustyrustacean/taxus)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.