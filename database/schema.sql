PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL UNIQUE,
    nickname TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    salt TEXT NOT NULL,
    signature TEXT NOT NULL DEFAULT '',
    disabled INTEGER NOT NULL DEFAULT 0,
    created_at TEXT NOT NULL,
    updated_at TEXT NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS friend_requests (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER NOT NULL,
    message TEXT NOT NULL DEFAULT '',
    status TEXT NOT NULL DEFAULT 'pending',
    created_at TEXT NOT NULL,
    handled_at TEXT NOT NULL DEFAULT '',
    FOREIGN KEY(sender_id) REFERENCES users(id),
    FOREIGN KEY(receiver_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS friendships (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_low INTEGER NOT NULL,
    user_high INTEGER NOT NULL,
    created_at TEXT NOT NULL,
    UNIQUE(user_low, user_high),
    FOREIGN KEY(user_low) REFERENCES users(id),
    FOREIGN KEY(user_high) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS chat_groups (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    owner_id INTEGER NOT NULL,
    created_at TEXT NOT NULL,
    FOREIGN KEY(owner_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS group_members (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    group_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    role TEXT NOT NULL DEFAULT 'member',
    joined_at TEXT NOT NULL,
    UNIQUE(group_id, user_id),
    FOREIGN KEY(group_id) REFERENCES chat_groups(id) ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS attachments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    owner_id INTEGER NOT NULL,
    file_name TEXT NOT NULL,
    mime_type TEXT NOT NULL,
    file_size INTEGER NOT NULL,
    data BLOB NOT NULL,
    created_at TEXT NOT NULL,
    FOREIGN KEY(owner_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS messages (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    sender_id INTEGER NOT NULL,
    receiver_id INTEGER,
    group_id INTEGER,
    message_type TEXT NOT NULL DEFAULT 'text',
    content TEXT NOT NULL DEFAULT '',
    attachment_id INTEGER,
    client_message_id TEXT,
    created_at TEXT NOT NULL,
    FOREIGN KEY(sender_id) REFERENCES users(id),
    FOREIGN KEY(receiver_id) REFERENCES users(id),
    FOREIGN KEY(group_id) REFERENCES chat_groups(id) ON DELETE CASCADE,
    FOREIGN KEY(attachment_id) REFERENCES attachments(id)
);

CREATE TABLE IF NOT EXISTS message_receipts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    message_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    delivered_at TEXT NOT NULL DEFAULT '',
    read_at TEXT NOT NULL DEFAULT '',
    UNIQUE(message_id, user_id),
    FOREIGN KEY(message_id) REFERENCES messages(id) ON DELETE CASCADE,
    FOREIGN KEY(user_id) REFERENCES users(id)
);

CREATE INDEX IF NOT EXISTS idx_friend_requests_receiver
ON friend_requests(receiver_id, status, created_at);

CREATE INDEX IF NOT EXISTS idx_friendships_low_high
ON friendships(user_low, user_high);

CREATE INDEX IF NOT EXISTS idx_group_members_user
ON group_members(user_id, group_id);

CREATE INDEX IF NOT EXISTS idx_messages_private
ON messages(sender_id, receiver_id, id);

CREATE INDEX IF NOT EXISTS idx_messages_group
ON messages(group_id, id);

CREATE UNIQUE INDEX IF NOT EXISTS idx_messages_client_dedupe
ON messages(sender_id, client_message_id);

CREATE INDEX IF NOT EXISTS idx_message_receipts_user
ON message_receipts(user_id, read_at, message_id);

CREATE INDEX IF NOT EXISTS idx_message_receipts_message
ON message_receipts(message_id, user_id);
