# Starchain

Official Golang implementation of the Ethereum protocol, forked for Starchain.

[![API Reference](
https://camo.githubusercontent.com/915b7be44ada53c290eb157634330494ebe3e30a/68747470733a2f2f676f646f632e6f72672f6769746875622e636f6d2f676f6c616e672f6764646f3f7374617475732e737667
)](https://pkg.go.dev/github.com/ethereum/go-ethereum?tab=doc)
[![Go Report Card](https://goreportcard.com/badge/github.com/ethereum/go-ethereum)](https://goreportcard.com/report/github.com/ethereum/go-ethereum)
[![Travis](https://travis-ci.com/ethereum/go-ethereum.svg?branch=master)](https://travis-ci.com/ethereum/go-ethereum)
[![Discord](https://img.shields.io/badge/discord-join%20chat-blue.svg)](https://discord.gg/nthXNEv)

Automated builds are available for stable releases and the unstable master branch. Binary
archives are published at https://geth.ethereum.org/downloads/.

## Table of Contents

- [Installation](docs/installation.md) - Building from source, prerequisites, and dependencies
- [Executables](docs/executables.md) - Command-line tools and utilities
- [Usage](docs/usage.md) - Running geth on different networks and programmatic interfaces
- [Configuration](docs/configuration.md) - Configuration files and Docker setup
- [Development](docs/development.md) - Private networks, mining, and contribution guidelines
- [Docker](docs/docker.md) - Docker configuration and build scripts

## Quick Start

To get started quickly with the main Ethereum network:

```shell
make geth
./build/bin/geth console
```

For testnet development:

```shell
./build/bin/geth --goerli console
```

## License

The go-ethereum library (i.e. all code outside of the `cmd` directory) is licensed under the
[GNU Lesser General Public License v3.0](https://www.gnu.org/licenses/lgpl-3.0.en.html),
also included in our repository in the `COPYING.LESSER` file.

The go-ethereum binaries (i.e. all code inside of the `cmd` directory) is licensed under the
[GNU General Public License v3.0](https://www.gnu.org/licenses/gpl-3.0.en.html), also
included in our repository in the `COPYING` file.
