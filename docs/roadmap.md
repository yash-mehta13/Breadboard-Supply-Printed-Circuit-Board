# Roadmap (future work, not existing functionality)

1. Owner review: correct the LM317 ADJ network (R3 to GND), reposition or re-wire the LED, and fix C3's connection.
2. Run ERC and DRC and fix findings.
3. Add input protection (reverse polarity), decide and document input voltage range.
4. Choose and document capacitor types/ratings and footprints; add input/output capacitors per datasheets.
5. Assign the existing net classes and widen power traces.
6. Verify datasheet figures; compute thermal dissipation; add heatsink footprint if needed.
7. Replace the Windows-specific `sym-lib-table` entry with a project-relative library.
8. Add a schematic screenshot/PDF and refresh screenshots to match current values.
9. Fabricate a prototype, photograph it, and record measurements.
10. Add MPNs and sourcing to the BOM from the purchased parts.
11. Choose a licence ([licensing.md](licensing.md)).
