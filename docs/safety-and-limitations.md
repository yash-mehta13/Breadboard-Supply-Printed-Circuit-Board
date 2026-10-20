# Safety and limitations

- **Low-voltage DC only.** Never connect mains or any mains-derived supply directly; use a certified, current-limited DC source.
- **Polarity.** The jack has no reverse-polarity protection. Confirm the plug's centre polarity matches pin 1 = tip = positive before connecting.
- **Input limits.** The design states no input range. Check the maximum input and dropout figures in the datasheets for the actual regulators you buy and stay within them with margin.
- **Current limit first.** Use a bench supply with a low current limit for the first power-up.
- **Heat.** Linear regulators dissipate (Vin − Vout) × Iout. With no heatsink and a high input voltage the TO-220 parts can become hot or hit thermal shutdown. Maximum safe output current is **unknown**.
- **Known circuit defect.** The 3.3 V stage as drawn has no ADJ-to-GND path; its output voltage is undefined by the design and could exceed 3.3 V. Do not connect 3.3 V loads until it is fixed and measured.
- **Output arrangement.** Rails are selected by a user jumper; a wrong jumper or shorted rail is not protected. No fuse, no short-circuit protection beyond what the regulators' internal limiting provides (unverified).
- **Capacitors.** Ratings are unspecified; use parts rated above the input voltage.
- **No validation.** The design has not been ERC/DRC-checked, built or tested; do not use it to power anything you cannot afford to damage.
