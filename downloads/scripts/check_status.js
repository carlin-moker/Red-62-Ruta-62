const ethers = require("ethers");
require("dotenv").config();
const fs = require("fs");

async function main() {
    const provider = new ethers.JsonRpcProvider(process.env.BASE_RPC_URL);
    const abi = JSON.parse(fs.readFileSync("./build/CGLCoreAlpha.abi", "utf8"));
    const contractAddress = "0x5D470eB0885a53856b3b0d2A11f44053B579E739";
    
    const contract = new ethers.Contract(contractAddress, abi, provider);
    
    const balance = await provider.getBalance(contractAddress);
    const absorbed = await contract.totalLiquidityAbsorbed();

    console.log("\n--- ESTATUS COSMICGEMLOGISTIC ---");
    console.log("Saldo en Bóveda:", ethers.formatEther(balance), "ETH");
    console.log("Liquidez Total Absorbida:", ethers.formatEther(absorbed), "ETH");
    console.log("----------------------------------\n");
}

main().catch(console.error);
