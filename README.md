# cups
docker run -d \
--name="cups" \
--privileged="true" \
--restart=always \
-p 631:631 \
-v /var/run/dbus:/var/run/dbus \
-v /dev/bus/usb:/dev/bus/usb \
-v /you cupsd.conf path/:/etc/cups \
rabbired/cups-airprint
