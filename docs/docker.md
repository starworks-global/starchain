# Docker Configuration

## Starlabs Registry Setup

To push Docker images to `registry.starlabs.web.id`, you need to configure it as an insecure registry due to TLS certificate issues.

### For Docker Desktop users:

1. Open Docker Desktop
2. Click Settings (gear icon)
3. Go to "Docker Engine" tab
4. Edit the JSON configuration to add:

```json
{
  "insecure-registries": ["registry.starlabs.web.id"]
}
```

5. Click "Apply & Restart"

### For Docker CLI users (Linux/Server):

1. Create or edit `/etc/docker/daemon.json`:

```json
{
  "insecure-registries": ["registry.starlabs.web.id"]
}
```

2. Restart Docker daemon:

```shell
sudo systemctl restart docker
```

### Usage

After configuration, you can push images using:

```shell
docker push registry.starlabs.web.id/your-image:tag
```

Make sure to tag your images appropriately before pushing to the registry.

## Build Scripts

Starchain provides automated build scripts for creating and publishing Docker images to the Starlabs registry.

### Prerequisites

- Docker installed and running
- Access to `registry.starlabs.web.id` (configured as insecure registry - see above)
- Docker login credentials for the registry

### Available Scripts

#### testnet.build.sh

Builds and pushes a Docker image for the Starchain testnet.

**Usage:**
```shell
./testnet.build.sh
```

**What it does:**
- Builds Docker image from `testnet.Dockerfile`
- Tags the image as `starchain-testnet:latest`
- Pushes to `registry.starlabs.web.id/starchain-testnet:latest`

#### mainnet.build.sh

Builds and pushes a Docker image for the Starchain mainnet.

**Usage:**
```shell
./mainnet.build.sh
```

**What it does:**
- Builds Docker image from `mainnet.Dockerfile`
- Tags the image as `starchain-mainnet:latest`
- Pushes to `registry.starlabs.web.id/starchain-mainnet:latest`

### Build Process

Both scripts follow the same process:

1. **Validation** - Checks if the required Dockerfile exists
2. **Build** - Creates Docker image using the appropriate Dockerfile
3. **Tag** - Tags the image for the registry
4. **Push** - Uploads the image to `registry.starlabs.web.id`
