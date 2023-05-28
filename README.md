# SIMPLE STORAGE PROJECT USING FOUNDRY

## Deploy Contracts

### Deploy Contracts on Localhost (`Anvil`)

1. Run foundry local node on a saperate terminal using `anvil` command.
2. Create a `.env` file and specify these environment variables inside it.

```bash
# anvil
# This is a RPC_URl of local node (Anvil) provided by foundry.
ANVIL_RPC_URL=http://127.0.0.1:8545
# This is a private key of the first account.
ANVIL_PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

3. Create an alias for the `ANVIL_RPC_URL` inside the `foundry.toml` file. This will help us later in the command. Make sure to add `[rpc_endpoints]` above it.

```toml
[rpc_endpoints]
anvil = "${ANVIL_RPC_URL}"
```

4. Compile the contracts using `forge build` command (fix any issues you face).
5. Load the `.env` file variables using the command `source .env`
6. Deploy the contracts using command;

```bash
forge create SimpleStorage --rpc-url anvil --private-key $ANVIL_PRIVATE_KEY
```

`Note: We only have 1 smart contract due to that we only specify the name of it (SimpleStorage) in the command but incase you have multiple contract inside the same file or in different files then you need to specify the full path of smart contract i.e in our case src/SimpleStorage.sol:SimpleStorage`

### Deploy Contracts on Testnet (`Sepolia`)

1. Specify the `SEPOLIA_RPC_URL`, `PRIVATE_KEY` and `ETHERSCAN_API_KEY` inside the `.env` file.

```env
SEPOLIA_RPC_URL=https://eth-sepolia.g.alchemy.com/v2/...
PRIVATE_KEY=...
ETHERSCAN_API_KEY=...
```

2. Add the alias for the `SEPOLIA_RPC_URL` below `[rpc_endpoints]`.

```toml
[rpc_endpoints]
sepolia = "${SEPOLIA_RPC_URL}"
```

3. In order to verify the smart contract on etherscan you will need to add etherscan api key inside `.env` file and add this configuration inside `foundry.toml` file so the command can detect the network automatically.

```toml
[etherscan]
sepolia = {key = "${ETHERSCAN_API_KEY}"}
```

You can read more about configurations here https://github.com/foundry-rs/foundry/tree/master/config

4. Deploy the contract using command;

```bash
forge create SimpleStorage --rpc-url sepolia --private-key $PRIVATE_KEY --verify
```
