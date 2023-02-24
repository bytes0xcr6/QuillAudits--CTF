const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Attacker", function () {
  async function deploy() {
    const signers = await ethers.getSigners();

    const D31eg4t3 = await ethers.getContractFactory("D31eg4t3");
    const d31eg4t3 = await D31eg4t3.connect(signers[0]).deploy();
    await d31eg4t3.deployed();

    const Attacker = await ethers.getContractFactory("Attacker");
    const attacker = await Attacker.connect(signers[1]).deploy(
      d31eg4t3.address
    );
    await attacker.deployed();

    return { d31eg4t3, signers, attacker };
  }

  describe("Deployment", function () {
    it("Attack", async function () {
      const { d31eg4t3, signers, attacker } = await loadFixture(deploy);

      await attacker.hack();

      expect(await d31eg4t3.owner()).to.equal(signers[1].address);
      expect(await d31eg4t3.canYouHackMe(signers[1].address)).to.equal(true);
      console.log("\n- The contract is HACKED!");
    });
  });
});
