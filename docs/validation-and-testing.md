# Validation and testing

## Executed in this review (2026-10-20)
| Check | Result |
|---|---|
| Native files parsed (script, Python) for symbols, pins, wires, labels, pad nets | Done |
| Schematic ↔ PCB reference/footprint/net comparison (all 17 parts) | Consistent for nets; footprints match schematic footprint fields |
| Board outline bounding box from Edge.Cuts | 53.5 × 33.0 mm |
| BOM cross-check: 17 footprints in PCB = 17 BOM quantities | Matches |
| Link/path check of repository documentation | Done (see CHANGELOG) |
| `kicad-cli` ERC / DRC / BOM export | **Not run: `kicad-cli` not installed and not installable here** |
| Datasheet verification | **Not done: manufacturer sites returned HTTP 403 via the sandbox proxy** |

The schematic review found the ADJ-network issue described in [circuit-design.md](circuit-design.md). No fix was applied.

## Pending checklist
- [ ] ERC clean or every message explained (`scripts/validate_kicad.sh`)
- [ ] DRC with schematic parity, no unconnected items
- [ ] ADJ network corrected; output voltage calculated from datasheet equation and confirmed
- [ ] Footprints verified against purchased parts (TO-220 pinout, barrel jack plug size and polarity, switch, LED pad polarity, terminal pitch)
- [ ] Board outline and notch fit checked against the target breadboard
- [ ] Clearances/trace widths reviewed (all tracks 0.2 mm); hatched GND zone connectivity
- [ ] Regulator dissipation computed for the chosen Vin/Iload; heatsink decision
- [ ] Capacitor values, types and voltage ratings chosen against datasheet requirements
- [ ] Gerber review in an independent viewer

## Bench test (only after the above, on an assembled board)
1. Visual and continuity inspection; check for shorts between each rail and GND with power off.
2. Use a current-limited bench supply, start at a low limit and a low voltage within the regulator datasheets' limits; observe polarity.
3. Measure `/5V` and `/3.3V` unloaded, then with known resistive loads; record input voltage, load, ripple and temperature.
4. Record results in an issue or PR with photos; do not claim ratings without measurements.
