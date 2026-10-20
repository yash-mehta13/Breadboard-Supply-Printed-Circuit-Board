# Changelog

## Unreleased — documentation and repository organisation (2026-10-20)
No hardware design files were changed.
- Rewrote README after comparing it with the KiCad files (removed unsupported AMS1117, USB, 6–12 V, ~800 mA, KiCad 7 and dual-LED claims).
- Added `docs/` (overview, circuit design, BOM, fabrication, validation, safety, roadmap, licensing), `CLAUDE.md`, `CONTRIBUTING.md`, GitHub issue/PR templates, `.gitignore` and `scripts/validate_kicad.sh`.
- Moved the four screenshots to `assets/images/` with descriptive names (`git mv`).
- Stopped tracking `fp-info-cache` (generated KiCad library cache, ~3.7 MB; working copy kept, now git-ignored).
