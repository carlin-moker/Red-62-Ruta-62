import dotenv from 'dotenv';
dotenv.config();

class ConfigLoader {
    constructor() {
        this.config = {
            nodeName: process.env.NODE_NAME || 'CosmicNode',
            nodeType: process.env.NODE_TYPE || 'full',
            chainId: process.env.CHAIN_ID || 62,
            port: process.env.RPC_PORT || 3000,
            protection: process.env.PROTECTION_PROTOCOL || 'DIVINE_SHIELD'
        };
        console.log(`[${this.config.protection}] Configuración cargada para ${this.config.nodeName}`);
    }
}

export const config = new ConfigLoader().config;

