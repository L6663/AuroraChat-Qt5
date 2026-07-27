# Repository Status

- Repository: `L6663/AuroraChat-Qt5`
- Visibility: public
- Stable branch: `main`
- Integration branch: `develop`
- Baseline toolchain: Qt 5.4 + MinGW 4.9.1 + qmake
- Validated managed source: `v1.4.2-alpha-emoji-render-fix`
- Current phase: `v1.5.0` P1 chat product experience

## Verified locally

- Client and server compile with Qt 5.4 + MinGW 4.9.1.
- Two local clients can exchange private text messages.
- The PNG-token emoji pipeline renders in the editor and on both message sides.
- The screenshot feature has been removed by product decision.

## Remaining release gate

Full account, friend, private-chat, group-chat, image, file, reconnect, old-database and Windows-deployment regression is still required before Beta.

## Source synchronization boundary

GitHub documentation, roadmap and Issues are current. The complete v1.4.2 managed source tree is ready for its one-time native Git import. The connected GitHub action can update repository text files and refs, but cannot directly upload a local directory as one atomic source tree; therefore the initial full-source push remains a separate Git operation. After that import, normal targeted commits and pull requests can be managed directly.
