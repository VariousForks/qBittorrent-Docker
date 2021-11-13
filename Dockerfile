# OS
FROM ubuntu:latest
# Set version label
LABEL maintainer="github.com/Dofamin"
LABEL image="qBittorrent"
LABEL OS="Ubuntu/latest"
# ARG & ENV
WORKDIR /srv/
ENV TZ=Europe/Moscow
# Update system packages:
RUN apt -y update > /dev/null 2>&1;\
# Fix for select tzdata region
    ln -fs /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone > /dev/null 2>&1;\
    dpkg-reconfigure --frontend noninteractive tzdata > /dev/null 2>&1;\
# Install dependencies, you would need common set of tools.
    apt -y install qbittorrent-nox > /dev/null 2>&1;\
# Cleanup
    apt-get clean > /dev/null 2>&1;
# Change WORKDIR    
WORKDIR /usr/bin/
# Expose Ports:
EXPOSE 8080/tcp 8080/udp 8999/tcp 8999/udp  
# CMD
CMD ["/bin/bash" , "-c" , "qbittorrent-nox"]
