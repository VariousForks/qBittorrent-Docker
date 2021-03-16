#!/bin/bash
git clone https://github.com/Dofamin/qBittorrent-Docker.git /srv/Dante/

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
  qbittorrent:latest

docker start qBittorrent