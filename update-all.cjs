const fs = require('fs');
const path = require('path');

const NEW_VERSION = "1.0.1";
const NEW_LICENSE = "Propiedad Prohibida Cosmicjuan.blockchain";
const NEW_AUTHOR = "Juan Martínez Lara (carlin-moker)";
const rootDir = "./"; 

fs.readdirSync(rootDir).forEach(file => {
    const projectPath = path.join(rootDir, file);
    const packageJsonPath = path.join(projectPath, 'package.json');

    // Solo entra si es carpeta y tiene un package.json
    if (fs.lstatSync(projectPath).isDirectory() && fs.existsSync(packageJsonPath)) {
        try {
            let data = JSON.parse(fs.readFileSync(packageJsonPath, 'utf8'));

            data.version = NEW_VERSION;
            data.license = NEW_LICENSE;
            data.author = NEW_AUTHOR;

            fs.writeFileSync(packageJsonPath, JSON.stringify(data, null, 2));
            console.log(`✅ Actualizado: ${file}`);
        } catch (err) {
            console.error(`❌ Error en ${file}:`, err.message);
        }
    }
});

