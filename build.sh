#! /bin/sh
adduser --system --group --home /var/cache/apt-cacher-ng apt-cacher-ng
mkdir -p identity
getent passwd apt-cacher-ng > identity/passwd
getent group apt-cacher-ng > identity/group
getent shadow apt-cacher-ng > identity/shadow
docker network create -d bridge lan-services 
docker build -t apt-cacher-ng .
