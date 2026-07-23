# Next P0 Checklist

## UI consistency

- [ ] Replace every remaining `QMessageBox` and `QInputDialog`.
- [ ] Standardize title bars, close buttons, spacing, focus, disabled state, and dangerous actions.
- [ ] Verify light and dark themes for every dialog.
- [ ] Avoid English native buttons and system message-box icons.

## Screenshot

- [ ] Verify cursor-screen selection on multi-monitor setups.
- [ ] Verify drag, reverse drag, minimum selection, Enter, double-click, Esc, and right-click.
- [ ] Prevent the overlay itself from appearing in the captured result.
- [ ] Add preview before sending.
- [ ] Verify temporary-file cleanup on success, failure, cancellation, and application exit.

## File transfer

- [ ] Add per-request timeout.
- [ ] Add bounded per-chunk retry.
- [ ] Add SHA-256 before upload and after download.
- [ ] Add reconnect/resume session metadata.
- [ ] Add a transfer task list instead of one blocking progress dialog.
- [ ] Test duplicate ACK, delayed ACK, disconnect, cancellation, invalid offset, and insufficient disk space.

## Regression

- [ ] Friend request accept/reject.
- [ ] Delete friend.
- [ ] Private text/image/file/screenshot.
- [ ] Group text/image/file.
- [ ] Offline message, reconnect, resend, delivery, and read states.
- [ ] Old database migration and application restart.
