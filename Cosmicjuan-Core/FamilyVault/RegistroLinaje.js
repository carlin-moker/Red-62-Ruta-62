// Script de Autorización para Nuevos Nodos Lara
const RegistroLinaje = {
    nodoMatriz: "yefris19",
    estado: "ESPERANDO_CONEXIONES",
    registrarHeredero: function(fid, walletAddress) {
        console.log(`[+] Autorizando FID ${fid} en el Bóveda Familiar...`);
        console.log(`[+] Wallet vinculada: ${walletAddress}`);
        // Aquí conectaremos la función de whitelist del CGL-Core-Alpha
    }
};
console.log("Sistema de linaje preparado.");
