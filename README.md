# OpenHands Custom Sandbox

A repository providing a Docker image for OpenHands custom sandbox environments. This image is based on Debian Bookworm with pre-installed [aqua](https://aquaproj.github.io/) CLI tool manager.

## Features

- Debian Bookworm base image
- Pre-installed aqua CLI
- Configured global aqua settings
- Pre-installed tools:
  - GitHub CLI (gh)
  - pnpm
  - Other tools specified in the configuration file

## Usage

### Pulling the Image

```bash
docker pull ghcr.io/upamune/openhands-custom-sandbox:latest
```

### Running the Container

```bash
docker run -it --rm ghcr.io/upamune/openhands-custom-sandbox:latest
```

## Installing Global pnpm Packages

You can install pnpm packages globally within the container using:

```bash
pnpm install -g [package-name]
```

Example:
```bash
pnpm install -g typescript zx
```

Installed global npm packages are automatically added to PATH and shared between different Node.js versions.

## Customization

### Adding Tools

Edit the `config/aqua.yaml` file to add tools you want to install.
Available tools can be found in the [aqua-registry](https://github.com/aquaproj/aqua-registry).

## Local Building

```bash
docker build -t openhands-custom-sandbox .
```

## Notes

- Global npm packages are shared between different Node.js versions

## License

See the [LICENSE](LICENSE) file.
