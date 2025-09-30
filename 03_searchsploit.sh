#!/usr/bin/env bash
# 03_searchsploit.sh
# Busca exploits con searchsploit si está instalado. Si no, muestra cómo buscar localmente.
# Uso: ./03_searchsploit.sh "Apache Struts 2.3.1" "CVE-2017-5638"
QUERY="$1"
CVE="$2"
if [ -z "$QUERY" ] && [ -z "$CVE" ]; then
  echo "Uso: $0 "<producto version>" "<CVE opcional>""
  exit 1
fi

if command -v searchsploit >/dev/null 2>&1; then
  if [ -n "$CVE" ]; then
    echo "[*] Buscando por CVE: $CVE"
    searchsploit "$CVE"
  else
    echo "[*] Buscando por texto: $QUERY"
    searchsploit "$QUERY"
  fi
else
  echo "[!] searchsploit no está instalado. Alternativa: buscar en carpeta local 'exploits-db/'"
  if [ -d "exploits-db" ]; then
    grep -Rni --exclude-dir=.git "$QUERY" exploits-db || echo "[!] No se encontró en exploits-db"
  else
    echo "[!] No existe la carpeta 'exploits-db' - instala searchsploit o clona ExploitDB para usarlo offline."
  fi
fi