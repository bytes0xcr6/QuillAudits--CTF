# VIP Bank Challenge

## Objective of CTF

- At any cost, lock the VIP user balance forever into the contract.

## Vulnerabilities

- Requirement of a total balance stored in the contract to withdraw funds, without any limit to store funds to the contract.
- Any VipUser can add funds to the contract, but if the total balance exceeds maxETH (0.5ETH), then the withdraw function will be locked.

### To solve it we need to...

- clone the repo, access to the folder VIP BANK

```
git clone "url"
```

- Install dependencies

```
npm i
```

- Run the script called VIP_Bank.js in the test folder with the next command:

```
npx hardhat test
```
