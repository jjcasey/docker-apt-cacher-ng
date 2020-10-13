#! /bin/sh
docker container rm apt-cacher-ng || /bin/true
docker run -td \
	--restart always \
	-e DEBBASE_SYSLOG=stdout \
	-e DEBBASE_TIMEZONE=`cat /etc/timezone` \
	--stop-signal=SIGRTMIN+3 \
	--tmpfs /run:size=100M \
	--tmpfs /run/lock:size=100M \
	-v /var/cache/apt-cacher-ng:/var/cache/apt-cacher-ng \
	-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
	-p 3142:3142 \
	--network lan-services \
	--name=apt-cacher-ng \
	apt-cacher-ng
