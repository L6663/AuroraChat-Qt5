# Roadmap

标记说明：

- `[x]`：源码已实现并通过静态审查；
- `[ ]`：尚未实现，或仍等待完整 Qt 5.4 实机回归。

## P0 — Reliability and UI consistency

- [x] Friend-request selection, request correlation, busy state and timeout
- [x] Message queued/pending/sent/delivered/read/failed states
- [x] Message ACK timeout and manual retry
- [x] Pending resend queue after reconnection
- [x] History cursor pagination, dedupe and draft persistence
- [x] Non-modal confirmation/input windows, PNG-token emoji panel and shared business-dialog shell
- [x] Screenshot feature removed by product decision
- [x] In-window transfer task cards that never disable MainWindow
- [x] Unified RequestTracker timeout, supersede, late-response suppression and disconnect release
- [x] File hashing and bounded persistent thumbnail generation in background threads
- [x] 48 KB acknowledged upload/download chunks
- [x] Transfer request timeout and retry policy
- [x] SHA-256 upload and download verification
- [x] Upload/download pause and resume after reconnect
- [x] Upload completion-response idempotency
- [x] Attachment/message atomic SQLite persistence
- [x] Filesystem-backed attachment payload storage with SQLite metadata
- [x] Incremental server upload hashing and offset-based download sessions
- [x] Legacy whole-file Base64 protocol disabled
- [x] MainWindow implementation split into five reviewable translation units
- [x] Incremental message rendering and history-scroll preservation
- [x] Source static audit and schema smoke tests
- [x] Qt 5.4 local client/server compile validation
- [x] Two-client private text and PNG-token emoji verification
- [ ] Full account/friend/private/group/image/file/reconnect regression matrix
- [ ] Windows deployment package validation

## P1 — Product experience (`v1.5.0`)

- [ ] Message context menu: copy, reply, forward and retract
- [ ] Reply quote bar and jump to original message
- [ ] Paste/drag image and file sending
- [ ] Conversation pin, mute and mark unread
- [ ] Compact chat layout for 1366×768 and high DPI
- [ ] Continue splitting message/conversation coordination out of `MainWindow`
- [ ] Dedicated transfer center and persistent task queue
- [x] Shared Aurora UI foundation: toast, empty state, settings card and dialog shell
- [x] Image viewer with cached preview and original-file download action
- [ ] Group name, avatar, announcement and owner transfer
- [ ] Avatar upload

## P2 — Customization

- [ ] ThemeManager with accent, bubble, font, radius and background settings
- [ ] Importable theme packages
- [ ] Login transition and background animation
- [ ] Layout density and navigation customization

## P3 — Desktop pet

- [ ] Transparent always-on-top independent pet window
- [ ] Idle, walk, sleep, message, happy and offline states
- [ ] New-message speech bubble and conversation jump
- [ ] Edge snapping, drag, context menu and resource-pack switching
