# Circuit design

Derived by parsing `PCB_01.kicad_sch` and `PCB_01.kicad_pcb` (KiCad 8.0 files). The schematic connectivity and PCB pad nets were compared and agree. `kicad-cli` was not available, so no ERC/DRC output exists.

## Power flow
1. **J5** barrel jack: pin 1 → net `/PWR_input`; pins 2 and 3 → GND.
2. **S1** (EG1218, 3-pin slide): pin 2 = `/PWR_input`, pin 1 = `/12V`, pin 3 unconnected (marked no-connect). `/12V` is only a net name; the design does not state an input voltage.
3. **U1 LM7805**: pin 1 (IN) `/12V`, pin 2 GND, pin 3 (OUT) `/5V`. **C1** 10 µF `/12V`→GND; **C2** 0.1 µF `/5V`→GND.
4. **U2 LM317**: pin 1 (ADJ) `Net-(U2-ADJ)`, pin 2 (OUT) `/3.3V`, pin 3 (IN) `/12V`. **R1** 0.33k between `/3.3V` and ADJ. **R3** 0.56k between ADJ and `Net-(D1-K)`. **C3** 1 µF between `/3.3V` and `Net-(D1-K)`.
5. **D1 LED**: anode `Net-(D1-A)` ← **R2** 0.33k ← `/12V`; cathode `Net-(D1-K)`.
6. **Outputs**: J4 (TOP) and J3 (BOT) 3-pin headers: pin 1 `/3.3V`, pin 2 rail (`PWR_OUT_TOP` / `PWR_OUT_BOT`), pin 3 `/5V`. A jumper placed pin1–2 or pin2–3 selects the rail voltage. `PWR_OUT_BOT` also appears on J1 pin 2 and J6 pin 2; `PWR_OUT_TOP` on J2 pin 2 and J7 pin 2. J1/J2/J6/J7 pin 1 = GND.

## Net summary
| Net | Connections |
|---|---|
| `/PWR_input` | J5.1, S1.2 |
| `/12V` | S1.1, U1.1, U2.3, C1.1, R2.2 |
| GND | J5.2/3, U1.2, C1.2, C2.2, J1.1, J2.1, J6.1, J7.1 |
| `/5V` | U1.3, C2.1, J3.3, J4.3 |
| `/3.3V` | U2.2, R1.2, C3.1, J3.1, J4.1 |
| `Net-(U2-ADJ)` | U2.1, R1.1, R3.2 |
| `Net-(D1-K)` | D1.1, R3.1, C3.2 |
| `Net-(D1-A)` | D1.2, R2.1 |
| `/PWR_OUT_TOP` | J4.2, J2.2, J7.2 |
| `/PWR_OUT_BOT` | J3.2, J1.2, J6.2 |

Pin-to-pad mapping for the TO-220 regulators (1/2/3) matches the standard LM7805 (IN/GND/OUT) and LM317 (ADJ/OUT/IN) orderings by symbol; confirm against the manufacturer datasheets for the parts actually purchased.

## Issues found (owner review required; design files NOT modified)
1. **LM317 ADJ has no connection to GND.** Intended topology is almost certainly R1 (OUT–ADJ) and R3 (ADJ–GND). Here R3 ends on the LED cathode net, and no other element ties that net to GND. The output cannot be assumed to be 3.3 V; the actual value depends on the LED/R2 path and load and was not measured or simulated. *Hypothetical only:* if R3 returned to GND, the standard formula Vout = 1.25 V × (1 + R3/R1) + Iadj·R3 with 330 Ω/560 Ω gives about 3.4 V (using the datasheet-typical 1.25 V reference and ~50 µA Iadj, not verified from datasheet here).
2. **D1 is in the ADJ path**, not across a rail. It is powered from the switched input through R2, and its cathode current goes into the LM317 network.
3. **C3** is connected to `Net-(D1-K)` not GND, so there is no output capacitor to ground on the 3.3 V rail, no ADJ bypass, and no dedicated LM317 input capacitor (C1 is shared on `/12V`).
4. No input protection (series diode/fuse/TVS): reversed or over-voltage plugs go directly to regulators.
5. All 82 track segments are 0.2 mm; the `power_input` / `power_output` net classes (0.35 mm) in the project file are not assigned to any net.
6. Capacitors C1–C3 share a `C_Disc_D3.0mm` footprint, including 10 µF.
7. Regulator heat: dissipation ≈ (Vin − Vout) × Iout per regulator; no heatsink is specified. No values computed because input voltage and load current are not defined.
8. Documentation discrepancy: the 2D screenshot shows R2/R3 values swapped relative to the current files.
9. `sym-lib-table` points to `C:/Users/YASH MEHTA/Downloads/EG1218/EG1218.kicad_sym` (non-portable, includes a personal path).

## Board
Edge.Cuts bounding box x 51.27–104.77 mm, y 82.77–115.77 mm = 53.5 × 33.0 mm, with rounded corners and a notch at the bottom between x 60.77–94.77 mm (about 6.5 mm deep). F.Cu and B.Cu; B.Cu has a hatched GND zone (1.0 mm hatch, 1.5 mm gap, 0.5 mm pad clearance). No vias.
