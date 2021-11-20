# [![Docker](https://github.com/Dofamin/qBittorrent-Docker/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/Dofamin/qBittorrent-Docker/actions/workflows/docker-publish.yml)
## qBittorrent-Docker

[qBittorrent](https://www.qbittorrent.org/) The qBittorrent project aims to provide an open-source software alternative to µTorrent.

Additionally, qBittorrent runs and provides the same features on all major platforms (FreeBSD, Linux, macOS, OS/2, Windows).

qBittorrent is based on the Qt toolkit and libtorrent-rasterbar library.

## Getting Started

* [Wiki](https://github.com/qbittorrent/qBittorrent/wiki)
* [Bugs](https://github.com/qbittorrent/qBittorrent/issues)
* [Forum](https://qbforums.shiki.hu/)

### Bulding

**Default login and password is ```admin:adminadmin```**

```shell
git clone https://github.com/Dofamin/qBittorrent-Docker.git /srv/qBittorrent/

docker build /srv/qBittorrent/ --tag qbittorrent 

docker rm --force qBittorrent

docker create \
  --name=qBittorrent \
  -p 8080:8080/tcp \
  -p 8080:8080/udp \
  -p 8999:8999/tcp \
  -p 8999:8999/udp \
  -v /srv/qBittorrent/container-image-root/:/root/.config/qBittorrent/\
  -v /srv/qBittorrent/container-image-root/Downloads/:/root/Downloads/\
  -v /srv/qBittorrent/container-image-root/Downloads/.temp/:/root/Downloads/.temp/\
  --restart unless-stopped \
  --memory="100m" \
  qbittorrent:latest

docker start qBittorrent
```

Or just pull from GitHub

```shell
docker pull ghcr.io/dofamin/qBittorrent-Docker:master

docker rm --force qBittorrent

docker create \
  --name=qBittorrent \
  -p 8080:8080/tcp \
  -p 8080:8080/udp \
  -p 8999:8999/tcp \
  -p 8999:8999/udp \
  -v /srv/qBittorrent/container-image-root/:/root/.config/qBittorrent/\
  -v /srv/qBittorrent/container-image-root/Downloads/:/root/Downloads/\
  -v /srv/qBittorrent/container-image-root/Downloads/.temp/:/root/Downloads/.temp/\
  --restart unless-stopped \
  --memory="100m" \
  ghcr.io/dofamin/qBittorrent-Docker:master

docker start qBittorrent

```

#### qBittorrent Features

* Polished µTorrent-like User Interface
* No Ads
* Well-integrated and extensible Search Engine
* Simultaneous search in many Torrent search sites
* Category-specific search requests (e.g. Books, Music, Software)
* RSS feed support with advanced download filters (incl. regex)
* Many Bittorrent extensions supported:
* Magnet links
* Distributed hash table (DHT), peer exchange protocol (PEX), local peer discovery (LSD)
* Private torrents
* Encrypted connections
* and many more...
* Remote control through Web user interface, written with AJAX
* Nearly identical to the regular GUI
* Sequential downloading (Download in order)
* Advanced control over torrents, trackers and peers
* Torrents queueing and prioritizing
* Torrent content selection and prioritizing
* Bandwidth scheduler
* Torrent creation tool
* IP Filtering (eMule & PeerGuardian format compatible)
* IPv6 compliant
* UPnP / NAT-PMP port forwarding support
* Available on all platforms: Windows, Linux, macOS, FreeBSD, OS/2

---

##### [Official qBittorrent GitHub Repository](https://github.com/qbittorrent/qBittorrent)
