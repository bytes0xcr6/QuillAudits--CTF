const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Attack", function () {
  async function deploy() {
    const signers = await ethers.getSigners();
    const SafeNFT = await ethers.getContractFactory("safeNFT");
    const safeNFT = await SafeNFT.deploy("Cristian", "CR6", 1);
    safeNFT.deployed();

    const Attacker = await ethers.getContractFactory("Attacker");
    const attacker = await Attacker.deploy(safeNFT.address);
    attacker.deployed();

    return { signers, attacker, safeNFT };
  }

  describe("Deployment", function () {
    it("Hack!", async function () {
      const { signers, attacker, safeNFT } = await loadFixture(deploy);

      // Pay fee + claim multiple NFTs
      await attacker.buynFT({ value: 1 });

      const balanceAfterHack = await safeNFT.balanceOf(signers[1].address);

      console.log(`The signer 1 now has ${balanceAfterHack} NFTs`);
      expect(balanceAfterHack).to.equal(100);
    });
  });
});
