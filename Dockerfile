FROM debian:testing
MAINTAINER RedZ

# Install basic tools and cups and drivers
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get -yy upgrade && \
	apt-get install -yy sudo locales whois cups cups-client cups-bsd avahi-discover \
	printer-driver-all hpijs-ppds hp-ppd hplip printer-driver-foo2zjs \
	printer-driver-fujixerox hpijs-ppds hp-ppd hplip && \
	apt-get clean && rm -rf /var/lib/apt/lists/* && \
	sed -i 's/Listen localhost:631/Listen 0.0.0.0:631/' /etc/cups/cupsd.conf && \
        sed -i 's/Browsing Off/Browsing On/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/>/<Location \/>\n  Allow All/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/admin>/<Location \/admin>\n  Allow All\n  Require user @SYSTEM/' /etc/cups/cupsd.conf && \
	sed -i 's/<Location \/admin\/conf>/<Location \/admin\/conf>\n  Allow All/' /etc/cups/cupsd.conf && \
	echo "ServerAlias *" >> /etc/cups/cupsd.conf && \
	echo "DefaultEncryption Never" >> /etc/cups/cupsd.conf
	
ENV DEBIAN_FRONTEND "" LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8 LANGUAGE=en_US:en TZ=Asia/Shanghai

COPY start-cups.sh /root/start-cups.sh
RUN chmod +x /root/start-cups.sh

CMD ["/root/start-cups.sh"]

EXPOSE 631
