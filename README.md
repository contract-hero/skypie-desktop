# Sky Pie for macOS

The macOS shell of [Sky Pie](https://github.com/contract-hero/skypie-core): a native
reading room for the HTML artifacts your tools generate, with live reload,
peer-to-peer sharing to your own paired devices and a `skypie://` scheme.

Everything the app does lives in the `core` submodule (skypie-core). This
repository owns only what makes it a macOS app: `src-tauri/tauri.conf.json`,
the icons, the capabilities, and a `main` that hands the generated Tauri
context to `skypie_app::app::run`.

## Build

```bash
git clone --recurse-submodules git@github.com:contract-hero/skypie-desktop.git
cd skypie-desktop
./scripts/build-app.sh
cp -R "target/release/bundle/macos/Sky Pie.app" /Applications/
```

First launch: right-click → Open (the app is not notarized).

Development: `pnpm install && pnpm tauri dev` (the front end is served from
`core/ui`).

## Updating core

```bash
git submodule update --init --recursive --remote --merge
git add core && git commit -m "core: <what changed>"
```
