#!/usr/bin/env python3
# 02_parse_nmap.py
# Parsea un XML de Nmap (salida -oX) y extrae hosts, puertos y versiones detectadas.
# Uso: ./02_parse_nmap.py example/sample_nmap.xml
import sys
import xml.etree.ElementTree as ET
import json

if len(sys.argv) < 2:
    print("Uso: {} <nmap_xml>".format(sys.argv[0]))
    sys.exit(1)

fn = sys.argv[1]
tree = ET.parse(fn)
root = tree.getroot()

results = []
for host in root.findall('host'):
    addr = host.find('address').get('addr') if host.find('address') is not None else None
    ports = []
    ports_node = host.find('ports')
    if ports_node is not None:
        for p in ports_node.findall('port'):
            portid = p.get('portid')
            proto = p.get('protocol')
            state = p.find('state').get('state') if p.find('state') is not None else None
            service = p.find('service')
            svc = {}
            if service is not None:
                svc['name'] = service.get('name')
                svc['product'] = service.get('product')
                svc['version'] = service.get('version')
            ports.append({'port': portid, 'proto': proto, 'state': state, 'service': svc})
    results.append({'address': addr, 'ports': ports})

out_fn = 'example/parsed_output.json'
with open(out_fn, 'w') as f:
    json.dump(results, f, indent=2)
print("[*] Parseado guardado en {}".format(out_fn))