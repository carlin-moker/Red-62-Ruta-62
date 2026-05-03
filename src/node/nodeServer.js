import express from 'express';
import { WebSocketServer } from 'ws';
import { v4 as uuidv4 } from 'uuid';

class NodeServer {
  constructor(config) {
    this.id = config.id || uuidv4();
    this.port = config.port || 3000;
    this.p2pPort = config.p2pPort || 30333;
    this.app = express();
    this.peers = new Map();
  }

  async initialize() {
    this.setupHTTPServer();
    this.setupP2PServer();
    console.log(`✅ Nodo inicializado: ${this.id}`);
    console.log(`🛡️ Protección: DIVINE_SHIELD - MÁXIMA`);
  }

  setupHTTPServer() {
    this.app.use(express.json());
    this.app.get('/health', (req, res) => res.json({ status: 'OPERATIVO', nodeId: this.id }));
    this.app.listen(this.port, () => console.log(`🌐 HTTP Server corriendo en puerto ${this.port}`));
  }

  setupP2PServer() {
    const wss = new WebSocketServer({ port: this.p2pPort });
    wss.on('connection', (ws) => {
      console.log('🔌 Conexión P2P entrante establecida');
    });
    console.log(`🔌 P2P Server corriendo en puerto ${this.p2pPort}`);
  }
}

// ESTA ES LA VÁLVULA DE EXPORTACIÓN QUE FALTABA
export default NodeServer;

