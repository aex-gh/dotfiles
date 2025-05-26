# mise

Installs [mise](https://mise.jdx.dev/)
for managing project specific node versions, installing project-specific CLIs,
and [running tasks](https://mise.jdx.dev/tasks/).

## Cross-platform support

This role now supports both macOS (via Homebrew) and Linux (via the official installation script).

- **macOS**: Installs via `brew install mise`
- **Linux**: Installs via the official script from `https://mise.run`

## Configuration

The role includes a default configuration that:
- Sets Node.js version to 22
- Enables idiomatic version file support for Node.js projects (reads `.nvmrc`, `.node-version`, etc.)

You can customise the configuration by modifying `files/config.toml`.
