# Project overview

## Objective
A small through-hole PCB that converts a DC barrel-jack input to 5 V and an adjustable (intended 3.3 V) rail for a solderless breadboard, with switchable input and an indicator LED.

## Scope
In scope: KiCad schematic, two-layer PCB, documentation. Out of scope today: validated performance data, fabrication files, firmware (none).

## Verified features (from `PCB_01.kicad_sch` / `.kicad_pcb`)
- Barrel jack input (J5) and slide switch (S1)
- LM7805 5 V stage and LM317 stage
- 3.3 V/5 V selection headers (J3, J4) feeding two breadboard rail outputs
- 2-pin headers (J1, J2) and screw terminals (J6, J7) for GND + rail
- One LED indicator (D1)
- Board 53.5 × 33.0 mm with a 34.0 × 6.5 mm bottom-edge notch

Not features: USB input, AMS1117, dual LEDs, protection circuitry.

## Repository contents
| Path | Description |
|---|---|
| `PCB_01.kicad_pro/.kicad_sch/.kicad_pcb` | Editable KiCad source of truth |
| `PCB_01.kicad_prl` | Local KiCad view state (ignored going forward) |
| `sym-lib-table` | Project symbol library table (contains an absolute Windows path) |
| `assets/images/` | KiCad screenshots (renders, not photos) |
| `docs/` | Engineering documentation and BOM |
| `scripts/validate_kicad.sh` | Runs ERC/DRC/BOM when `kicad-cli` is installed |

## Development state
Design draft. ERC/DRC not run, circuit defect(s) identified in review (see [circuit-design.md](circuit-design.md)), never confirmed as built or tested.
