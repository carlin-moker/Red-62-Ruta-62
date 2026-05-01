import os
import hashlib

def inicializar_sistema():
    # Identidad única para vincular tus dispositivos
    titular = "Juan Martínez Lara"
    semilla = f"{titular}-Red62-Soberania-Divina"
    llave_maestra = hashlib.sha256(semilla.encode()).hexdigest()
    
    # Estructura de carpetas de la Red 62
    rutas = [
        "Red62-Kernel/core",
        "Red62-Kernel/nodos",
        "Red62-Kernel/Boveda_Privada"
    ]
    
    for ruta in rutas:
        os.makedirs(os.path.expanduser(f"~/{ruta}"), exist_ok=True)
    
    # Creación del archivo de identidad del dispositivo
    config_path = os.path.expanduser("~/Red62-Kernel/core/config.sys")
    with open(config_path, "w") as f:
        f.write(f"ID_RED=62\n")
        f.write(f"OPERADOR={titular.replace(' ', '_')}\n")
        f.write(f"LLAVE_MAESTRA={llave_maestra}\n")
        f.write(f"ESTADO=SINCRONIZADO\n")

    print("\n--- SISTEMA RED 62 INICIALIZADO ---")
    print(f"Operador: {titular}")
    print(f"Llave Maestra: {llave_maestra[:16]}... [OK]")
    print(f"Estructura de Bóveda: CREADA")
    print("-----------------------------------\n")

if __name__ == "__main__":
    inicializar_sistema()

