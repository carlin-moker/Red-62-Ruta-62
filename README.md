// SPDX-License-Identifier: PROPIEDAD_PROHIBIDA
// Cosmicjuan.blockchain - Infraestructura Red 62
// Optimización Criptofisicomatemática - Fusión Total

const { ethers } = require("hardhat");

async function main() {
    console.log("--------------------------------------------------");
    console.log("Iniciando despliegue de infraestructura soberana...");
    console.log("--------------------------------------------------");

    const [deployer] = await ethers.getSigners();
    console.log("Desplegando con Operador Alpha:", deployer.address);

    // 1. Desplegar CosmicQuantumNucleus (El motor unificado)
    // Este contrato reemplaza a los individuales para evitar conflictos de fusión.
    const Nucleus = await ethers.getContractFactory("CosmicQuantumNucleus");
    const nucleus = await Nucleus.deploy();
    
    // Bloqueo de sincronización: Esperamos a que el contrato esté en la cadena
    await nucleus.waitForDeployment(); 

    const nucleusAddress = await nucleus.getAddress();

    console.log("✅ NÚCLEO DESPLEGADO EN:", nucleusAddress);
    console.log("Estado: OPERATIVO - Operador: carlin-moker");
    console.log("Frecuencia: Red 62 - Blindaje Metacuántico Activo");
    console.log("--------------------------------------------------");
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error("❌ ERROR EN EL BLOQUEO:");
        console.error(error);
        process.exit(1);
    });
