const hre = require("hardhat");

async function main() {
  console.log("Arrancando el motor de despliegue de CosmicGemLogistic...");
  
  // Apuntamos al contrato recién compilado
  const vault = await hre.ethers.deployContract("FamilyVaultLara");
  
  await vault.waitForDeployment();
  
  console.log(`[+] Bóveda Lara anclada exitosamente en la dirección: ${vault.target}`);
  console.log(`[+] Estatus: Esperando acoplamiento de nodos familiares.`);
}

main().catch((error) => {
  console.error("Falla en el motor de despliegue:", error);
  process.exitCode = 1;
});
