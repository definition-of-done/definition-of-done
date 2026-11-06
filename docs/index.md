# Requirements Index

Traceability root: `REQ → UC → spec → test → code → docs`. Every REQ gets a row when
created; the row is only marked done when the full chain resolves (§7 of AGENTS.md).

| REQ | Title | Status | Architecture | Use cases | Specs | Tests | Code | Docs |
| --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [REQ-0001](REQ-0001.md) | Founding product requirement | Stage 1 approved | [approved](ARCHITECTURE.md) | [approved ×4](UC-0001.md) | — | — | — | — |
| [REQ-0002](REQ-0002.md) | Value & collateral capture | Stage 0 approved | [approved](ARCHITECTURE.md) | [approved ×2](UC-0004.md) | — | — | — | — |

## Conventions

- One row per REQ. Mark a cell `—` until that artifact exists, `✓` when it resolves.
- A REQ may not advance a pipeline stage until its row shows the prior stage's artifact.
- Stage 0 exit requires a GitHub issue for every known activity — see the issue tracker.
