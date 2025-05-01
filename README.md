# Foundry ERC721 NFT

## About

This project demonstrates the creation and management of ERC721 NFTs using Foundry, a powerful toolkit for Ethereum development. The code showcases how to leverage Foundry's components to build, test, and deploy smart contracts efficiently.

Key highlights of the project include:

- **ERC721 Implementation**: A standard for creating non-fungible tokens (NFTs) on Ethereum.
- **Testing with Forge**: Comprehensive tests to ensure the functionality and security of the smart contracts.
- **Local Development with Anvil**: A local Ethereum node for rapid testing and debugging.
- **Deployment Scripts**: Scripts to deploy the contracts to an Ethereum network.

This project serves as a practical example of using Foundry to streamline the NFT development workflow.

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

<https://book.getfoundry.sh/>

## Usage

### Build

```shell
forge build
```

### Test

```shell
forge test
```

### Format

```shell
forge fmt
```

### Gas Snapshots

```shell
forge snapshot
```

### Anvil

```shell
anvil
```

### Deploy

```shell
forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
cast <subcommand>
```

### Help

```shell
forge --help
anvil --help
cast --help
```
