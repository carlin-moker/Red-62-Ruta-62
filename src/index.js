import NodeServer from './node/nodeServer.js';
import dotenv from 'dotenv';

dotenv.config();

async function arrancarMotor() {
  console.log('🌌 Iniciando Red-62 (CosmicGemLogistic)...');
  const node = new NodeServer({ port: 3000, p2pPort: 30333 });
  await node.initialize();
  console.log('🛡️ Motor P2P en marcha. Protección divina activada.');
}

arrancarMotor();
import './node/nodeServer.js';
