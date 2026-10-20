# Fabrication and assembly

**Not ready to order.** ERC/DRC have not been run and the circuit issues in [circuit-design.md](circuit-design.md) are unresolved. No Gerbers are stored in this repository and none have been reviewed.

## Open and review
1. Install KiCad 8.0 or newer. Open `PCB_01.kicad_pro`.
2. Schematic Editor: run *Inspect → Electrical Rules Checker*, resolve or document each message.
3. PCB Editor: *Inspect → Design Rules Checker* (tick "Test for parity between PCB and schematic"). The project's min copper-edge clearance is 0.5 mm, min hole clearance 0.25 mm, default clearance 0.2 mm.
4. Inspect in the 3D viewer: TO-220 orientation, headers, barrel-jack overhang.

## Outputs
- **BOM**: Schematic Editor → *Tools → Generate BOM*, or `kicad-cli sch export bom PCB_01.kicad_sch`. Compare to [bill-of-materials.csv](bill-of-materials.csv).
- **Gerbers**: PCB Editor → *File → Fabrication Outputs → Gerbers*. Layers: F.Cu, B.Cu, F.Silkscreen, B.Silkscreen, F.Mask, B.Mask, Edge.Cuts (confirm F/B.Paste and fab layers are not needed for a through-hole-only board; check which layers exist in the file).
- **Drill**: *File → Fabrication Outputs → Drill Files* (Excellon, plated and non-plated).
- **Assembly / placement**: not required for hand assembly; all parts are through-hole. A position file can be exported if a service requires it.
- Equivalent CLI: `kicad-cli pcb export gerbers`, `kicad-cli pcb export drill` (syntax per installed version's `--help`).

## What a fabricator usually needs
Gerber set + drill files (zipped), board size (53.5 × 33.0 mm), layer count (2), thickness (1.6 mm per file), finish and copper weight (**not specified by the project: choose and record**), and quantity.

## Hand assembly notes
- Solder low-profile parts first (resistors, capacitors), then LED, switch, regulators, headers, jack, terminals.
- Verify the LED polarity (square pad = cathode per footprint) and regulator pin orientation against the silkscreen/3D view.
- Place no jumper until the 3.3 V stage is corrected and verified.
- Regulators carry no heatsink in the design.

## Manual actions before ordering
Fix/confirm issues in circuit-design.md, run ERC/DRC clean, review Gerbers in a viewer, choose manufacturing options, and test per [validation-and-testing.md](validation-and-testing.md).
