import express from 'express';
import { processEnterpriseFlow } from './core-access.js';

const app = express();
app.use(express.json());

// Puerto soberano para el nodo local de Red 62
const PORT = 6262; 

app.post('/api/v1/transaction', (req, res) => {
    const { userSATM, baseCost } = req.body;
    
    // Ejecución del núcleo criptofísicomatemático
    const response = processEnterpriseFlow(userSATM, baseCost);
    
    if (!response.authorized) {
        return res.status(403).json(response);
    }
    
    return res.status(200).json(response);
});

app.listen(PORT, () => {
    console.log(`🚀 Nodo Independiente Red 62 operativo en puerto ${PORT}`);
});

