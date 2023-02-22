# Confidential Hash Challenge
## Objective of CTF

Find the keccak256 hash of aliceHash and bobHash. 

## Vulnerabilities
- None data in Blockchain is private. So storing aliceHash & bobHash as private does not make it inaccessible.

## To solve it we need to...

1- Run the Script in the repo called script.js to get the data stored as private keys.

Get the Storage position for "ALICE_PRIVATE_KEY" (Which is the Slot 2).
```
web3.eth.getStorageAt(contract, 2, (err, result) => {
  console.log(result);
});
// key1 Result: 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```
Get the Storage position for "BOB_PRIVATE_KEY" (Which is the Slot 7).
```
web3.eth.getStorageAt(contract, 7, (err, result) => {
  console.log(result);
});

// key2 Result: 0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c6
```

2- Replicate the hash function hasing the Private key & the Data of each user.
3- Call the function check with the hashing result from Private key & Data of both users concatenated.

<img width="793" alt="image" src="https://user-images.githubusercontent.com/102038261/220606528-1b7c2b24-c771-4824-9958-be6e0945ad21.png">
- Contract deployed to: 0x274693D49EfBe7C2c69e677C6d7943100B519715

Please, check the attacker contract in the repo that I created.
