const fs = require('fs');
const path = require('path');
const solc = require('solc');

const contratos = ['cjIdentity.sol', 'cjRelayer.sol', 'cjLiquidity.sol'];

console.log("=== INICIANDO COMPILACIÓN CRIPTOFÍSICOMATEMÁTICA ===");

contratos.forEach(archivo => {
    const ruta = path.resolve(__dirname, archivo);
    if (!fs.existsSync(ruta)) {
        console.error(`[-] Error: No se encuentra el archivo ${archivo}`);
        return;
    }

    console.log(`\n[+] Leyendo estructura de: ${archivo}...`);
    const codigo = fs.readFileSync(ruta, 'utf8');

    const input = {
        language: 'Solidity',
        sources: { [archivo]: { content: codigo } },
        settings: { outputSelection: { '*': { '*': ['abi', 'evm.bytecode'] } } }
    };

    try {
        const output = JSON.parse(solc.compile(JSON.stringify(input)));
        
        if (output.errors) {
            output.errors.forEach(err => {
                if (err.severity === 'error') throw new Error(err.message);
                console.log(`[!] Advertencia: ${err.message}`);
            });
        }

        const nombreContrato = archivo.replace('.sol', '');
        const nombreClase = nombreContrato.charAt(0).toUpperCase() + nombreContrato.slice(1);
        const contratoCompilado = output.contracts[archivo][nombreClase];

        if (contratoCompilado) {
            const rutaAbi = path.resolve(__dirname, `${nombreContrato}_abi.json`);
            fs.writeFileSync(rutaAbi, JSON.stringify(contratoCompilado.abi, null, 2));
            console.log(`[✓] ABI generado con éxito: ${nombreContrato}_abi.json`);
        } else {
            console.error(`[-] No se encontraron los artefactos para ${nombreClase}`);
        }
    } catch (error) {
        console.error(`[-] Error al compilar ${archivo}:`, error.message);
    }
});

console.log("\n====================================================");
