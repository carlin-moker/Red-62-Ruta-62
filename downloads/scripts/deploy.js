const ethers = require("ethers");
const fs = require("fs");
require("dotenv").config();

async function main() {
    const provider = new ethers.JsonRpcProvider(process.env.BASE_RPC_URL);
    const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);

    const abi = fs.readFileSync("./build/CGLCoreAlpha.abi", "utf8");
    const binary = fs.readFileSync("./build/CGLCoreAlpha.bin", "utf8");

    console.log("Desplegando contrato CosmicGemLogistic...");
    const factory = new ethers.ContractFactory(abi, binary, wallet);
    const contract = await factory.deploy();

    await contract.waitForDeployment();
    console.log("Contrato desplegado en la dirección:", await contract.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exit(1);
});
