# Primera rama: `feature/primeros-3-pasos`
Repositorio preparado con **los primeros 3 pasos** de la clase (reconocimiento -> búsqueda de exploit -> preparación del listener/payload).
Este repositorio contiene scripts y ejemplos para ejecutar en un laboratorio controlado.

## Estructura
- `01_scan_nmap.sh` : Script para lanzar un escaneo Nmap (producción de XML).
- `02_parse_nmap.py` : Script Python que parsea el XML de Nmap y extrae servicios/versiones relevantes.
- `03_searchsploit.sh` : Script que muestra cómo usar `searchsploit` (o buscar en una carpeta local de exploits).
- `example/` : Contiene `sample_nmap.xml` (salida de ejemplo) y `parsed_output.json`.
- `msf_examples/` : Contiene plantilla de archivo resource `.rc` para msfconsole si quieres continuar (opcional).
- `LICENSE` : Archivo con nota sobre uso ético.
- `README.md` : Este archivo.

