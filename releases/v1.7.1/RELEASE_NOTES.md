# AuroraChat v1.7.1-alpha — Dragon Desktop Pet

## Release type

Qt 5.4 / C++11 source release for Windows desktop development and verification.

## Highlights

- Replaces the earlier simplified vector pet with the user-provided orange baby-dragon model.
- Uses the original dragon image as the only character asset; no generated action frames or substitute character artwork.
- Supports arbitrary desktop positioning rather than forced four-edge placement.
- Adds free roaming, facing-direction mirroring, idle breathing, walking, flying, jumping, happy, fire-breathing, magic, sleep, offline and message-notification states.
- Adds code-rendered forest fireflies, embers, magic circle and cloud scenes.
- Preserves login animation, per-account navigation customization, message bubbles, conversation jump, tray recovery and network-state integration.
- Retains Qt 5.4 and C++11 compatibility constraints.

## Package contents

- `AuroraClient/` — Qt Widgets desktop client
- `AuroraServer/` — TCP server
- `AuroraCommon/` — shared protocol and packet codec
- `database/` — SQLite schema and migration material
- `docs/` — architecture, compatibility and regression documentation
- `tests/` — static audit scripts
- `scripts/` — local launch helpers
- `AuroraChat.pro` — qmake SUBDIRS project

## Build requirements

- Qt 5.4
- MinGW 4.9.1 or compatible Qt 5.4 toolchain
- qmake

Open `AuroraChat.pro`, select the Qt 5.4 kit, run qmake, then build all subprojects. Start `AuroraServer` before launching one or more `AuroraClient` instances.

## Validation

- ZIP integrity test: passed
- SHA-256: `fc2ec37d4722afef9bb49df8a935d63a5628860d6ea2aba96a91ef691cc71b16`
- Static project audits: 13/13 passed
- Qt 5.4 / C++11 compatibility findings: 0
