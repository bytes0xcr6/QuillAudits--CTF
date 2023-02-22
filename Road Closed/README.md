# Road Closed
Objective of CTF

- Become the owner of the contract
- Change the value of hacked to true

# To solve it we need to...
1. We need to be added to the whitelistedMinters mapping by calling the function addToWhitelist() from an EOA (NOT A CONTRACT).
2. We need to call the function changeOwner() and passing our address as a parameter. As we are in the whitelistedMinters as true, the msg.sender is the same address that we are passing as a parameter and we are not calling the function from a contract. It will let as set the owner as the address passed as parameter.
3. Then we just need to call the function pwn() passing our address as a parameter and it will set the variable hacked as true.
