# Safe NFT Walkthrough

### Objective of CTF: 
Claim multiple NFTs for the price of one.

### Vulnerabilities
- The main vulnerability in the contract is that you can reentry through the function onERC721Received(). The minting contract will call to our contract to check if we do have this function as a requirement (It means our contract can manage ERC721 NFTs, so they won´t be stacked).
- As the main contract calls to our contract, we can add the logic to call back as many times to the minting contract and we will pass the requirement of
```
require(price==msg.value,"INVALID_VALUE");
```
as we paid the first minting price.

## To solve it we need to...
1. Pay the minting fee.
2. Fill up the onERC721Received() function in our contract with the logic to recall the claim() function from the minting contract.
3. Call the claim function & then it will call internally the function onERC721Received() and it will inicialized a loop of claims. 
