# Aurora Chat

> A Qt 5.4 desktop instant-messaging system built with C++, Qt Widgets, TCP, SQLite, custom application-layer framing, offline message recovery, group chat, and chunked file transfer.

Aurora Chat is a product-oriented desktop IM project. It focuses on the engineering path from requirement analysis and protocol design to client/server implementation, reliability improvements, UI customization, testing, and Windows delivery.

## Highlights

- **Qt 5.4 + C++11 + Qt Widgets** desktop client
- **QTcpServer / QTcpSocket** persistent connections
- Custom packet framing with magic number, body length, message type, and request ID
- Registration, login, profile, friend requests, contacts, private chat, and group chat
- Message persistence, history pagination, drafts, unread counts, reconnection, resend queue, and delivery states
- Image and file messages with **48 KB acknowledged chunks**, progress, cancel, resume, and download authorization
- Non-modal PNG emoji panel, image viewer, confirmation/input windows, and in-window transfer task cards
- File hashing and image thumbnail generation moved to a background worker thread
- SQLite stores message and attachment metadata; attachment payloads use filesystem storage
- Custom frameless window, light/dark themes, system tray, and reusable UI components
- SQLite data access isolated behind `DatabaseManager`

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
├── docs/              # Requirements, architecture, audits, roadmap
├── scripts/           # Local launch scripts
└── AuroraChat.pro     # qmake SUBDIRS project
```

## Current status

Current managed source version: **v1.4.2-alpha-emoji-render-fix**.

Implemented in the managed source tree:

- friend, private-chat, group-chat, history, unread, draft, reconnect, resend, receipt, and SQLite persistence flows;
- all known business `QDialog::exec()` and blocking window-modality paths removed from the client;
- non-modal PNG emoji panel, image viewer, confirmation/input windows, and in-window transfer task cards;
- background file SHA-256 and thumbnail generation so heavy attachment work does not block the GUI thread;
- 48 KB acknowledged file chunks, timeout/retry, transfer resume, cancellation, authorization, stale-response suppression, disconnect-state release, and SHA-256 verification;
- attachment destinations frozen before asynchronous work, preventing chat switches from sending to the wrong recipient;
- server-side attachment payloads stored on disk with SQLite metadata, bounded persistent thumbnails, incremental upload hashing, offset-based downloads, session limits, and cleanup;
- MainWindow implementation split into chat, dialogs, packets, state, and transfer translation units; message history uses incremental prepend/append rendering.

Static, interaction-core, UI-consistency, emoji-pipeline, and database smoke audits pass. Qt 5.4 + MinGW 4.9.1 client/server compilation and a two-client private text/PNG-emoji verification have passed. Full account, friend, group, image, file, reconnect and deployment regression are still required before Beta.

The repository has been updated with the validated v1.4.2 status and the v1.5 P1 plan. The one-time complete source-tree import remains a separate Git operation because the connected repository action cannot upload a local directory in one call.

See [Roadmap](docs/ROADMAP.md) and [Known Issues](docs/KNOWN_ISSUES.md).

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
6. Register different accounts and test friend, private chat, group, and transfer flows.

Default server endpoint:

```text
127.0.0.1:9527
```

## Engineering value

This project demonstrates:

- client/server architecture and application-layer protocol design;
- TCP sticky-packet and partial-packet handling;
- asynchronous UI state management with Qt signals and slots;
- message idempotency, pending queues, delivery/read receipts, and reconnection;
- SQLite schema design and parameterized queries;
- chunked file transfer, filesystem-backed payload storage, permissions, cancellation, resume, and integrity verification;
- reusable Qt Widgets, QSS themes, custom frameless dialogs, and desktop integration;
- Vibe Coding workflow with requirement decomposition, AI-assisted implementation, manual review, debugging, and iterative validation.

## Resume summary

> Developed a Qt 5.4 desktop instant-messaging system using C++, Qt Widgets, QTcpSocket/QTcpServer, a custom framed JSON protocol, and SQLite. Implemented account and friend workflows, private/group messaging, history pagination, offline resend and delivery states, chunked file transfer, image/file delivery, system tray integration, and light/dark themes and reusable non-modal interaction components. Used a structured Vibe Coding workflow for requirement decomposition, code generation, review, debugging, and iterative delivery.

## License

MIT
