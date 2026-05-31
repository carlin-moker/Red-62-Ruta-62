require('dotenv').config();
const config = require('config');

console.log("\n--- [ESTADO DE SENSORES: RED 62] ---");
try {
    // Intentamos leer la configuración mapeada desde el .env
    const slashing = config.get('Network.slashingEnabled');
    const rate = config.get('Network.slashingRate');
    const peer = config.get('Network.peerThreshold');
    const ddos = config.get('Network.ddosProtection');

    console.log("Slashing Activo:", slashing);
    console.log("Tasa de Multa:", rate);
    console.log("Umbral de Pares:", peer);
    console.log("Escudo DDoS:", ddos);
    console.log("-----------------------------------");
    console.log("Estado: OPERATIVO Y SINCRONIZADO");
} catch (e) {
    console.log("ERROR DE LECTURA:", e.message);
    console.log("Tip: Verifica que el archivo .env tenga los valores correctos.");
}
