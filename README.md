// SPDX-License-Identifier: PROPIEDAD_PROHIBIDA
// Script de Despliegue Soberano - Red 62 / Cosmicjuan.blockchain
// Optimización Criptofisicomatemática para Fusión Total

const { ethers } = require("hardhat");

async function main() {
    const [deployer] = await ethers.getSigners();

    console.log("====================================================");
    console.log("INICIANDO DESPLIEGUE DE INFRAESTRUCTURA SOBERANA");
    console.log("Desplegando con la cuenta:", deployer.address);
    console.log("====================================================");

    // 1. Desplegar CosmicRouteQuantumAlpha (Intercambio sin gas + Vault)
    // Este contrato actúa como el núcleo de liquidez y certificación
    console.log("1. Desplegando CosmicRouteQuantumAlpha...");
    const CosmicRoute = await ethers.getContractFactory("CosmicRouteQuantumAlpha");
    const cosmicRoute = await CosmicRoute.deploy();
    await cosmicRoute.waitForDeployment(); // Corrección para versiones recientes de ethers

    const cosmicRouteAddress = await cosmicRoute.getAddress();
    console.log("✅ CosmicRoute desplegado en:", cosmicRouteAddress);
    console.log("Estado: OPERATIVO - Operador: carlin-moker");

    // 2. Desplegar CosmicHydraQuantumNFT (Legado y Activos)
    // Integra la lógica de las 34 Morenas y el blindaje de activos
    console.log("\n2. Desplegando CosmicHydraQuantumNFT...");
    const HydraNFT = await ethers.getContractFactory("CosmicHydraQuantumNFT");
    const hydraNFT = await HydraNFT.deploy();
    await hydraNFT.waitForDeployment();

    const hydraNFTAddress = await hydraNFT.getAddress();
    console.log("✅ HydraNFT desplegado en:", hydraNFTAddress);
    console.log("Estado: OPERATIVO - Frecuencia: Red 62");

    console.log("\n====================================================");
    console.log("FUSIÓN COMPLETADA EXITOSAMENTE");
    console.log("Infraestructura lista para protección del linaje.");
    console.log("====================================================");
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error("\n❌ Error en el despliegue:");
        console.error(error);
        process.exit(1);
    });
