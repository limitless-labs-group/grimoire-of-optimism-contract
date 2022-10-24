
# Grimoire of Optimism smart contract project bootstrapped with Foundry + Hardhat

## Use with Foundry

Make sure to install foundry locally first: https://book.getfoundry.sh/getting-started/installation

```
git clone https://github.com/atlantis-world-core/alpha-pass-contract.git
cd alpha-pass-contract
npm ci
forge install
```
### Test

```
forge test -vv
```

### Deploy

```
forge create src/AWGrimoireOfOptimism.sol:AWGrimoireOfOptimism --rpc-url <rpc_url> --private-key <private_key> --legacy
```

### Verify
```
forge verify-contract --chain-id <chain_id> --num-of-optimizations 1000000 --watch --compiler-version v0.8.15+commit.e14f2714 <the_contract_address> src/AWGrimoireOfOptimism:AWGrimoireOfOptimism <your_etherscan_api_key>
```

### Send transaction

```
cast send <CONTRACT_ADDRESS> "airdrop(address)()" <ADDRESS> --rpc-url <RPC_URL> --private-key <PRIVATE_KEY> --legacy --gas 1000000
```

## Use with Hardhat

```
npm install
npm run test
```