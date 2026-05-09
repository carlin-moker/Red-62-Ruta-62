import NodeServer from './node/nodeServer.js';
import NetworkManager from './red/networkManager.js';
import dotenv from 'dotenv';

dotenv.config();

async function arrancarMotor() {
  console.log('🌌 Iniciando Red-62 (CosmicGemLogistic)...');
  
  // 1. Iniciar Gestor de Red
  const network = new NetworkManager({
    bootstrapNodes: process.env.BOOTSTRAP_NODES?.split(',') || []
  });
  await network.initialize();

  // 2. Iniciar Servidor del Nodo
  const node = new NodeServer({ 
    port: process.env.NODE_PORT || 3000, 
    p2pPort: process.env.P2P_PORT || 30333 
  });
  await node.initialize();

  console.log('🛡️ Sistema P2P y Nodo sincronizados. Protección DIVINE_SHIELD.');
}

arrancarMotor();

