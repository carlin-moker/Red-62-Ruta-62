const fs = require('fs');
console.log("--- INICIANDO PROTOCOLO COSMICJUAN ---");
function validarCarga() {
    const ruta = 'airdrop.csv';
    if (!fs.existsSync(ruta)) {
        console.log("Error: No existe airdrop.csv");
        return;
    }
    const contenido = fs.readFileSync(ruta, 'utf8');
    const lineas = contenido.split('\n');
    let totalTokens = BigInt(0);
    let detectadas = 0;
    lineas.forEach((linea) => {
        const partes = linea.split(',');
        if (partes.length >= 2) {
            const amount = partes[1].trim();
            if (amount && !isNaN(amount) && amount !== "") {
                try {
                    totalTokens += BigInt(amount);
                    detectadas++;
                } catch (e) {}
            }
        }
    });
    console.log("Líneas válidas:", detectadas);
    console.log("Total Tokens:", totalTokens.toString());
    console.log("--- PROCESO TERMINADO ---");
}
validarCarga();
