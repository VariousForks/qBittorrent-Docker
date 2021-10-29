# OS
FROM centos:7
# Set version label
LABEL maintainer="github.com/Dofamin"
LABEL image=qBittorrent
LABEL OS=Centos7
# Update system packages:
RUN yum -y update > /dev/null 2>&1;\
#General required dependencies
    yum -y install epel-release  > /dev/null 2>&1;\
    yum -y install wget unzip yum-plugin-remove-with-leaves > /dev/null 2>&1;\
    yum -y install qbittorrent-nox > /dev/null 2>&1;\
# Clean up
    yum -y autoremove > /dev/null 2>&1 ;\
    yum clean all > /dev/null 2>&1;\
    rm -rf /var/cache/yum > /dev/null 2>&1
# Expose Ports:
EXPOSE 8080/tcp 8080/udp 8999/tcp 8999/udp    
CMD ["/usr/bin/qbittorrent-nox"]
