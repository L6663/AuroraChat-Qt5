# Aurora Chat

> A Qt 5.4 desktop instant-messaging system built with C++, Qt Widgets, TCP, SQLite, custom application-layer framing, offline message recovery, group chat, and chunked file transfer.

Aurora Chat is a product-oriented desktop IM project. It focuses on the engineering path from requirement analysis and protocol design to client/server implementation, reliability improvements, UI customization, testing, and Windows delivery.

## Highlights

- **Qt 5.4 + C++11 + Qt Widgets** desktop client
- **QTcpServer / QTcpSocket** persistent connections
- Custom packet framing with magic number, body length, message type, and request ID
- Registration, login, profile, friend requests, contacts, private chat, and group chat
- Message persistence, history pagination, drafts, unread counts, reconnection, resend queue, and delivery states
- Image and file messages with **48 KB acknowledged chunks**, progress, cancel, and download authorization
- Custom frameless window, light/dark themes, system tray, unified dialogs, and region screenshot workflow
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

The project is under active development. Core private chat, friend, group, history, settings, and transfer flows are implemented. Current work focuses on product-level consistency and reliability:

- unified custom dialogs instead of native `QMessageBox` / `QInputDialog`;
- region screenshot selection and compressed temporary-image delivery;
- transfer recovery, timeout handling, integrity verification, and better task UI;
- login animation, theme editor, and desktop pet after core reliability is stable.

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
- chunked file transfer, permissions, cancellation, and progress feedback;
- reusable Qt Widgets, QSS themes, custom frameless dialogs, and desktop integration;
- Vibe Coding workflow with requirement decomposition, AI-assisted implementation, manual review, debugging, and iterative validation.

## Resume summary

> Developed a Qt 5.4 desktop instant-messaging system using C++, Qt Widgets, QTcpSocket/QTcpServer, a custom framed JSON protocol, and SQLite. Implemented account and friend workflows, private/group messaging, history pagination, offline resend and delivery states, chunked file transfer, screenshot delivery, system tray integration, and customizable themes. Used a structured Vibe Coding workflow for requirement decomposition, code generation, review, debugging, and iterative delivery.

## License

MIT
