// Configuración de Seguridad Biométrica WebAuthn
// Ecosistema CosmicGemLogistic
const authConfig = {
    rp: { name: "CosmicGemLogistic" },
    user: { id: "CGL-ADMIN-01", name: "Juan Martinez Lara" },
    challenge: "PROPIEDAD_PROHIBIDA_2026",
    pubKeyCredParams: [{ type: "public-key", alg: -7 }] // ES256
};
console.log("Escudo WebAuthn Configurado.");
