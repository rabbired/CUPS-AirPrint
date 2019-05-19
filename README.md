# cups
docker run -d --name="cups" --privileged="true" --restart always -p 6631:631/tcp \
  -e CUPS_USER_ADMIN="" -e CUPS_USER_PASSWORD="" \
  -v /var/run/dbus:/var/run/dbus -v /dev/bus/usb:/dev/bus/usb \
  rabbired/CUPS-AirPrint

