#!/usr/bin/env bash
# 01_scan_nmap.sh
# Escaneo básico con Nmap que guarda salida en XML (útil para análisis automático).
# Uso: ./01_scan_nmap.sh 192.168.56.101
TARGET="$1"
if [ -z "$TARGET" ]; then
  echo "Uso: $0 <IP|rango|hostname>"
  exit 1
fi
OUT="example/scan_$(echo $TARGET | tr '/' '_').xml"
echo "[*] Lanzando escaneo Nmap contra $TARGET. Salida -> $OUT"
nmap -sC -sV -oX "$OUT" "$TARGET"
echo "[*] Escaneo finalizado."