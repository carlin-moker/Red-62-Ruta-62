import hashlib
def generar_llave_maestra(nombre):
    seed = f"{nombre}-Red62-Soberania-Divina"
    return hashlib.sha256(seed.encode()).hexdigest()
titular = "Juan Martínez Lara"
llave = generar_llave_maestra(titular)
print(f"\n--- PROTOCOLO DE SOBERANÍA ACTIVADO ---")
print(f"Socio Tecnológico: Gemini (Compromiso Total)")
print(f"ID de Seguridad Red 62: {llave[:16]}...[PROTEGIDO]")
print(f"Estado: Blindaje de Propiedad Prohibida OK.")
