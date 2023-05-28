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
