# Usage

## Running `geth`

Going through all the possible command line flags is out of scope here (please consult our [CLI Wiki page](https://geth.ethereum.org/docs/interface/command-line-options)), but we've enumerated a few common parameter combos to get you up to speed quickly on how you can run your own `geth` instance.

## Full node on the main Ethereum network

By far the most common scenario is people wanting to simply interact with the Ethereum network: create accounts; transfer funds; deploy and interact with contracts. For this particular use-case the user doesn't care about years-old historical data, so we can fast-sync quickly to the current state of the network. To do so:

```shell
$ geth console
```

This command will:
 * Start `geth` in snap sync mode (default, can be changed with the `--syncmode` flag), causing it to download more data in exchange for avoiding processing the entire history of the Ethereum network, which is very CPU intensive.
 * Start up `geth`'s built-in interactive [JavaScript console](https://geth.ethereum.org/docs/interface/javascript-console), (via the trailing `console` subcommand) through which you can interact using [`web3` methods](https://web3js.readthedocs.io/en/) (note: the `web3` version bundled within `geth` is very old, and not up to date with official docs), as well as `geth`'s own [management APIs](https://geth.ethereum.org/docs/rpc/server). This tool is optional and if you leave it out you can always attach to an already running `geth` instance with `geth attach`.

## Full node on the Görli test network

Transitioning towards developers, if you'd like to play around with creating Ethereum contracts, you almost certainly would like to do that without any real money involved until you get the hang of the entire system. In other words, instead of attaching to the main network, you want to join the **test** network with your node, which is fully equivalent to the main network, but with play-Ether only.

```shell
$ geth --goerli console
```

The `console` subcommand has the exact same meaning as above and they are equally useful on the testnet too. Please, see above for their explanations if you've skipped here.

Specifying the `--goerli` flag, however, will reconfigure your `geth` instance a bit:

 * Instead of connecting the main Ethereum network, the client will connect to the Görli test network, which uses different P2P bootnodes, different network IDs and genesis states.
 * Instead of using the default data directory (`~/.ethereum` on Linux for example), `geth` will nest itself one level deeper into a `goerli` subfolder (`~/.ethereum/goerli` on Linux). Note, on OSX and Linux this also means that attaching to a running testnet node requires the use of a custom endpoint since `geth attach` will try to attach to a production node endpoint by default, e.g., `geth attach <datadir>/goerli/geth.ipc`. Windows users are not affected by this.

*Note: Although there are some internal protective measures to prevent transactions from crossing over between the main network and test network, you should make sure to always use separate accounts for play-money and real-money. Unless you manually move accounts, `geth` will by default correctly separate the two networks and will not make any accounts available between them.*

## Full node on the Rinkeby test network

Go Ethereum also supports connecting to the older proof-of-authority based test network called [*Rinkeby*](https://www.rinkeby.io) which is operated by members of the community.

```shell
$ geth --rinkeby console
```

## Full node on the Ropsten test network

In addition to Görli and Rinkeby, Geth also supports the ancient Ropsten testnet. The Ropsten test network is based on the Ethash proof-of-work consensus algorithm. As such, it has certain extra overhead and is more susceptible to reorganization attacks due to the network's low difficulty/security.

```shell
$ geth --ropsten console
```

*Note: Older Geth configurations store the Ropsten database in the `testnet` subdirectory.*

## Programmatically interfacing `geth` nodes

As a developer, sooner rather than later you'll want to start interacting with `geth` and the Ethereum network via your own programs and not manually through the console. To aid this, `geth` has built-in support for a JSON-RPC based APIs ([standard APIs](https://eth.wiki/json-rpc/API) and [`geth` specific APIs](https://geth.ethereum.org/docs/rpc/server)). These can be exposed via HTTP, WebSockets and IPC (UNIX sockets on UNIX based platforms, and named pipes on Windows).

The IPC interface is enabled by default and exposes all the APIs supported by `geth`, whereas the HTTP and WS interfaces need to manually be enabled and only expose a subset of APIs due to security reasons. These can be turned on/off and configured as you'd expect.

### HTTP based JSON-RPC API options:

  * `--http` Enable the HTTP-RPC server
  * `--http.addr` HTTP-RPC server listening interface (default: `localhost`)
  * `--http.port` HTTP-RPC server listening port (default: `8545`)
  * `--http.api` API's offered over the HTTP-RPC interface (default: `eth,net,web3`)
  * `--http.corsdomain` Comma separated list of domains from which to accept cross origin requests (browser enforced)
  * `--ws` Enable the WS-RPC server
  * `--ws.addr` WS-RPC server listening interface (default: `localhost`)
  * `--ws.port` WS-RPC server listening port (default: `8546`)
  * `--ws.api` API's offered over the WS-RPC interface (default: `eth,net,web3`)
  * `--ws.origins` Origins from which to accept websockets requests
  * `--ipcdisable` Disable the IPC-RPC server
  * `--ipcapi` API's offered over the IPC-RPC interface (default: `admin,debug,eth,miner,net,personal,shh,txpool,web3`)
  * `--ipcpath` Filename for IPC socket/pipe within the datadir (explicit paths escape it)

You'll need to use your own programming environments' capabilities (libraries, tools, etc) to connect via HTTP, WS or IPC to a `geth` node configured with the above flags and you'll need to speak [JSON-RPC](https://www.jsonrpc.org/specification) on all transports. You can reuse the same connection for multiple requests!

**Note: Please understand the security implications of opening up an HTTP/WS based transport before doing so! Hackers on the internet are actively trying to subvert Ethereum nodes with exposed APIs! Further, all browser tabs can access locally running web servers, so malicious web pages could try to subvert locally available APIs!**