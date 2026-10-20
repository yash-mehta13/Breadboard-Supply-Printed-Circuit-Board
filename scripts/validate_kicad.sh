#!/usr/bin/env bash
# Runs ERC, DRC and a BOM export with kicad-cli (KiCad 8+). Reports are written
# to ./kicad-reports/ (not committed; see .gitignore).
set -u
cd "$(dirname "$0")/.."
if ! command -v kicad-cli >/dev/null 2>&1; then
  echo "kicad-cli not found: ERC/DRC NOT run." >&2; exit 2
fi
out=kicad-reports; mkdir -p "$out"; rc=0
kicad-cli version
kicad-cli sch erc --severity-all --exit-code-violations -o "$out/erc.rpt" PCB_01.kicad_sch || rc=1
kicad-cli pcb drc --severity-all --schematic-parity --exit-code-violations -o "$out/drc.rpt" PCB_01.kicad_pcb || rc=1
kicad-cli sch export bom -o "$out/bom.csv" PCB_01.kicad_sch || rc=1
echo "Reports in $out/ (exit $rc; nonzero = violations or errors)"; exit $rc
