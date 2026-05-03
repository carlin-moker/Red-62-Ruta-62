import dotenv from 'dotenv';
import { ethers } from 'ethers';
import fs from 'fs';
import readline from 'readline';
import chalk from 'chalk';

dotenv.config();

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

const question = (query) => new Promise((resolve) => rl.question(query, resolve));

async function initializeWalletSystem() {
  console.log(chalk.blue('\n🌌 Inicializando sistema de cartera Red-62...'));
  
  try {
    if (!fs.existsSync('./data/wallet')) {
      fs.mkdirSync('./data/wallet', { recursive: true });
    }

    console.log(chalk.yellow('\n📋 Opciones:'));
    console.log('1. Generar nueva cartera');
    console.log('2. Restaurar desde mnemonic');
    
    const choice = await question('\n¿Qué deseas hacer? (1-2): ');

    let wallet;
    if (choice === '1') {
      wallet = ethers.Wallet.createRandom();
      console.log(chalk.green('\n✅ Nueva cartera generada.'));
      console.log(chalk.red('⚠️  GUARDA ESTA MNEMONIC EN LUGAR SEGURO:'));
      console.log(chalk.white(wallet.mnemonic.phrase));
    } else {
      const phrase = await question('\nIngresa tu mnemonic:\n> ');
      wallet = ethers.Wallet.fromPhrase(phrase);
      console.log(chalk.green('\n✅ Cartera restaurada.'));
    }

    const password = await question('\nIngresa contraseña para encriptar la cartera:\n> ');
    const encryptedJson = await wallet.encrypt(password);
    
    fs.writeFileSync('./data/wallet/operator-wallet.json', encryptedJson);
    console.log(chalk.green('\n✅ Cartera encriptada y guardada en ./data/wallet/operator-wallet.json'));
    console.log(chalk.blue('📍 Address: ') + wallet.address);

    rl.close();
  } catch (error) {
    console.error(chalk.red('\n❌ Error:'), error.message);
    rl.close();
  }
}

initializeWalletSystem();
