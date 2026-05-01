const { ethers } = require("hardhat");

async function main() {
    // Variables de entorno que llenaremos con los datos de tu sangre
    const direccionContrato = process.env.VAULT_ADDRESS; 
    const billeteraHeredero = process.env.WALLET_NIETO;
    const porcentajeCarga = process.env.PORCENTAJE;

    console.log(`[+] Nodo Matriz yefris19 autorizando...`);
    const VaultLara = await ethers.getContractAt("FamilyVaultLara", direccionContrato);
    
    console.log(`[+] Acoplando billetera ${billeteraHeredero} a la Bóveda...`);
    const tx = await VaultLara.registrarDescendencia(billeteraHeredero, porcentajeCarga);
    await tx.wait();
    
    console.log(`[+] ÉXITO: Heredero blindado con el ${porcentajeCarga}% de la carga en Base Mainnet.`);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
