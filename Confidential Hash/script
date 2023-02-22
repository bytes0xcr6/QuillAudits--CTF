const Web3 = require("web3");
const web3 = new Web3(
  "https://goerli.infura.io/v3/9aa3d95b3bc440fa88ea12eaa4456161"
);

const contract = "0xf8E9327E38Ceb39B1Ec3D26F5Fad09E426888E66";

async function main() {
  // It will return the slot 2th, which is the last position in the data array
  await web3.eth.getStorageAt(contract, 2, (err, result) => {
    console.log(result);
  });

  // It will return the slot 5th, which is the last position in the data array
  await web3.eth.getStorageAt(contract, 7, (err, result) => {
    console.log(result);
  });
}

main();
