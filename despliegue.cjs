const { Web3 } = require('web3');
const fs = require('fs');

// Conectamos con el nodo público de Base
const web3 = new Web3('https://mainnet.base.org');

const abi = JSON.parse(fs.readFileSync('VaultSoberano_sol_VaultSoberano.abi', 'utf8'));
const bin = fs.readFileSync('VaultSoberano_sol_VaultSoberano.bin', 'utf8');

console.log("Motor listo. Esperando orden del Magnate para inyectar en Base...");
