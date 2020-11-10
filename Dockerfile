FROM alpine
#
# BUILD:
#   wget https://raw.githubusercontent.com/thbe/docker-cups/master/Dockerfile
#   docker build --rm --no-cache -t thbe/cups .
#
# USAGE:
#   wget https://raw.githubusercontent.com/thbe/docker-cups/master/start_cups.sh
#   ./start_cups.sh
#

# Set metadata
LABEL maintainer="Thomas Bendler <project@bendler-net.de>"
LABEL version="1.3"
LABEL description="Creates an Alpine container serving a CUPS instance accessible through airplay as well"

# Set environment
ENV LANG en_US.UTF-8
ENV TERM xterm

# Set workdir
WORKDIR /opt/cups

# Install CUPS/AVAHI
#RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
&& apk update --no-cache && apk add --no-cache alpine-sdk cups cups-filters avahi inotify-tools groff \
&& git clone https://github.com/mikerr/foo2zjs.git \
#&& wget -O foo2zjs.tar.gz http://foo2zjs.rkkda.com/foo2zjs.tar.gz \
#&& tar zxf foo2zjs.tar.gz \
&& cd foo2zjs \
&& make \
&& make install

# Copy configuration files
COPY root /

# Prepare CUPS container
RUN chmod 755 /srv/run.sh

# Expose SMB printer sharing
EXPOSE 137/udp 139/tcp 445/tcp

# Expose IPP printer sharing
EXPOSE 631/tcp

# Expose avahi advertisement
EXPOSE 5353/udp

# Start CUPS instance
CMD ["/srv/run.sh"]
