# TrustTunnel Redux

> **Unofficial fork.** This project is a personal fork of the
> [TrustTunnel Flutter Client](https://github.com/TrustTunnel/TrustTunnelFlutterClient).
> It is **not affiliated with or endorsed by the upstream project**, and it is
> **not** an official release channel. Use at your own risk.

> **Different app identifier.** Redux installs as **`com.adguard.trusttunnel.redux`**,
> so it can be installed **alongside** the official TrustTunnel app on the same device.

TrustTunnel Redux keeps the upstream functionality and adds the following
features on top of it.

## Dark theme

The app supports both a light and a dark theme, with three modes available in
**Settings → Appearance**:

- **System** — follow the device appearance
- **Light** — always use the light theme
- **Dark** — always use the dark theme

The selection is saved and applied across the whole app.

## Experimental feature: SOCKS5 proxy mode (Android)

In addition to the standard TUN (virtual network interface) mode, Redux can run
the backend in **SOCKS5 proxy mode** — the client exposes a local SOCKS5 proxy
(127.0.0.1 or any interface) instead of a TUN device. Only one mode is active at
a time (TUN **or** SOCKS).

- Configurable **port**, **username/password** (authentication is enforced), and
  **bind address** (`127.0.0.1` by default; `0.0.0.0` to allow connections from
  the local network)
- Works with apps/tools that can use a SOCKS5 proxy
- Settings: **Settings → Connection mode**

This feature required matching experimental changes in the native client
library (see [TrustTunnelClient-redux](https://github.com/i-zhirov/TrustTunnelClient-redux)).

## Inherited from upstream

Redux is based on upstream **TrustTunnel v1.3.0**, which adds:

- A full-featured **Windows app** (Windows 10/11) with a tray menu and
  launch/auto-connect options
- **Duplicate** and **share** actions for server configurations
- **TLS fingerprint** selection (Chrome, Chrome Canary, Safari, Firefox,
  OkHttp, OpenSSL, BoringSSL)
- **TLS authentication** via a **Client Random Auth Key**
- **macOS 13 (Ventura)** as the minimum supported macOS version

## Getting builds

Installable packages (APK/AAB) are published as
[GitHub Releases](https://github.com/i-zhirov/TrustTunnelFlutterClient-redux/releases).
The latest release is
[v1.3.0-redux.1](https://github.com/i-zhirov/TrustTunnelFlutterClient-redux/releases/tag/v1.3.0-redux.1).

You can also install/update with [Obtainium](https://github.com/ImranR98/Obtainium)
by adding this repository and filtering for the `app-release.apk` asset.

Redux releases currently provide Android packages; other platforms can be built
from source.

## Branch layout

- `master` — default and integration branch: upstream code plus the Redux
  features; used for releases
- `socks5-proxy-support`, `dark-theme` — feature branches kept in sync with
  `master`

## Upstream documentation

The original upstream README is preserved at
[`README_UPSTREAM.md`](README_UPSTREAM.md) — please refer to it for the full
project description, architecture, and upstream usage instructions.
