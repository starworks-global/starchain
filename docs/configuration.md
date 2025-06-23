# Configuration

## Configuration Files

As an alternative to passing the numerous flags to the `geth` binary, you can also pass a configuration file via:

```shell
$ geth --config /path/to/your_config.toml
```

To get an idea how the file should look like you can use the `dumpconfig` subcommand to export your existing configuration:

```shell
$ geth --your-favourite-flags dumpconfig
```

*Note: This works only with `geth` v1.6.0 and above.*

## Docker Quick Start

One of the quickest ways to get Ethereum up and running on your machine is by using Docker:

```shell
docker run -d --name ethereum-node -v /Users/alice/ethereum:/root \
           -p 8545:8545 -p 30303:30303 \
           ethereum/client-go
```

This will start `geth` in fast-sync mode with a DB memory allowance of 1GB just as the above command does. It will also create a persistent volume in your home directory for saving your blockchain as well as map the default ports. There is also an `alpine` tag available for a slim version of the image.

Do not forget `--http.addr 0.0.0.0`, if you want to access RPC from other containers and/or hosts. By default, `geth` binds to the local interface and RPC endpoints is not accessible from the outside.

## Network Configuration

For network-specific configurations and settings, refer to the [Usage Guide](usage.md) for details on connecting to different Ethereum networks (mainnet, testnets, etc.).