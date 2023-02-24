# D31eg4t3 Challenge

### Objective of CTF:

- Become the owner of the contract.
- Make canYouHackMe mapping to true for your own
  address.

### Vulnerabilities

- Using DelegateCall can be dangerous.
- When using DelegateCall this time, it opens the contract to interact with to any, leaving the contract as address(msg.sender). If the contract is malicious it can modify any slot of the contract.

## To solve it we need to...

1. Struct the Attacker contract as the Vulnerable contract (D31eg4t3.sol)
2. We need to call the hackMe() function from the (D31eg4t3.sol) passing an empty string. Then the contract will call to our contract with no instructions of what function it should call. So it will go directly to our Fallback() function.
3. We jus need to fill up the logic to modify the variable owner & the mapping canYouHackMe from the D31eg4t3 contract.
