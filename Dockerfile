FROM jgoerzen/debian-base-security:latest
VOLUME ["/var/cache/apt-cacher-ng"]

COPY identity/ /tmp/identity/

COPY setup/ /usr/local/debian-base-setup/
RUN /usr/local/debian-base-setup/040-apt-cacher-ng

EXPOSE 3142
CMD ["/usr/local/bin/boot-debian-base"]
