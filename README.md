# Aurora Chat

> A Qt 5.4 desktop instant-messaging system built with C++, Qt Widgets, TCP, SQLite, a custom application-layer protocol, offline recovery, group chat, chunked file transfer, customizable navigation and an interactive desktop pet.

## Current release

**v1.7.1-alpha-dragon-pet**

This release replaces the earlier simplified vector pet with the user-provided orange baby-dragon model. The character uses a single source image, while movement, facing direction, breathing, jumping, flying, fire, magic, sleep, offline and message-notification effects are simulated in Qt code.

Release metadata, checksums and notes are stored under `releases/v1.7.1/`.

## Highlights

- **Qt 5.4 + C++11 + Qt Widgets** desktop client
- **QTcpServer / QTcpSocket** persistent connections
- Custom packet framing with magic number, body length, message type and request ID
- Registration, login, profile, friend requests, contacts, private chat and group chat
- Message persistence, history pagination, drafts, unread counts, reconnection, resend queues and delivery states
- Reply, forwarding, recall and conversation jump flows
- Image and file messages with acknowledged chunks, progress, cancel, retry, resume and integrity verification
- SQLite message and attachment metadata with filesystem-backed attachment payloads
- Light, dark and customizable themes
- Animated login page and per-account navigation ordering/visibility
- Orange baby-dragon desktop pet with arbitrary positioning, roaming, scenes and message bubbles
- Static compatibility and regression audit suite for the managed source tree

## Architecture

```text
AuroraClient (Qt Widgets)
    │
    │ TCP + custom framed JSON protocol
    ▼
AuroraServer (QTcpServer)
    │
    ├── authentication / friends / chat / groups
    ├── message routing / online connection management
    ├── chunked upload and download sessions
    └── SQLite persistence
```

## Repository layout

```text
AuroraChat/
├── AuroraClient/      # Desktop client
├── AuroraServer/      # TCP server
├── AuroraCommon/      # Shared protocol and packet codec
├── database/          # SQLite schema
├── docs/              # Requirements, architecture, audits and roadmap
├── tests/             # Static audit scripts
├── scripts/           # Local launch helpers
├── releases/          # Release notes, manifests and checksums
└── AuroraChat.pro     # qmake SUBDIRS project
```

## v1.7.1 desktop-pet behavior

- Uses the supplied orange dragon artwork as the only character model
- Does not generate replacement character images or action-frame sheets
- Allows arbitrary desktop coordinates instead of forced four-edge placement
- Supports left/right mirroring according to movement direction
- Supports idle breathing, roaming, flight, jump, happy, fire, magic, sleep, offline and notification states
- Supports clean, forest-firefly, ember, magic-circle and cloud scenes rendered with `QPainter`
- Preserves tray recovery, network-state integration and chat-message navigation
- Saves visibility, position, size, scene and behavior options per account

## Build

Requirements:

- Qt 5.4
- MinGW 4.9.1 or a compatible Qt 5.4 toolchain
- qmake

Steps:

1. Open `AuroraChat.pro` in Qt Creator.
2. Select the Qt 5.4 Kit.
3. Run qmake and build all subprojects.
4. Start `AuroraServer` first.
5. Start two or more `AuroraClient` instances.
6. Register different accounts and test friend, private-chat, group and transfer flows.

Default server endpoint:

```text
127.0.0.1:9527
```

## Validation status

The v1.7.1 source archive passed ZIP integrity verification. The recorded SHA-256 is:

```text
fc2ec37d4722afef9bb49df8a935d63a5628860d6ea2aba96a91ef691cc71b16
```

The managed source records report 13/13 project audits passing with no Qt 5.4/C++11 compatibility finding.

## Engineering boundary

Aurora Chat is currently positioned as a Qt/C++ engineering and job-portfolio project. Direct public-internet production deployment would still require TLS, stronger password hashing, session/token management, abuse rate limits, file-content inspection, monitoring, backup and operational hardening.

## License

MIT
