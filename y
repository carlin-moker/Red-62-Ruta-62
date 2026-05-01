const { ethers } = require("ethers");
require("dotenv").config();
const { exec } = require("child_process");

async function escucharVibraciones() {
    const provider = new ethers.providers.JsonRpcProvider(process.env.RPC_URL);
    const miDireccion = "TU_BILLETERA_AQUI";

    console.log("🌀 Sensor de Vibración: ACTIVO. Escuchando el flujo del vacío...");

    provider.on("block", async (blockNumber) => {
        const balance = await provider.getBalance(miDireccion);
        const eth = ethers.utils.formatEther(balance);
        
        console.log(`[Bloque ${blockNumber}] Frecuencia estable. Balance actual: ${eth} ETH`);

        // Alerta si el balance cambia (Justicia o Aporte)
        // Solo enviará notificación si detecta movimiento
    });
}

escucharVibraciones().catch(console.error);

