# Contributing

## Reporting issues
Use the issue templates. Give the affected file, reference designator/net, expected vs observed behaviour, KiCad version and steps to reproduce. Attach screenshots or ERC/DRC output. No personal information is needed.

## Proposing circuit changes
Open an issue first. Explain the problem, cite datasheet pages for any part limits, and show calculations. Do not change footprints or routing without evidence.

## Editing documentation
Keep claims traceable to the KiCad files or a cited datasheet. Mark unknowns as unverified. Check every relative link.

## Checks before a PR
Use KiCad 8.0+. Run ERC and DRC (or `scripts/validate_kicad.sh`) and report results honestly, including failures. Update the BOM if parts change. Keep generated files (Gerbers, caches, backups) out of the PR unless publishing a release.

## Pull requests
Small, focused, with the PR template completed and hardware evidence (screenshots, measurements, test conditions) where relevant. Note that the repository has no licence yet ([docs/licensing.md](docs/licensing.md)).
