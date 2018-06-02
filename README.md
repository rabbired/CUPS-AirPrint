# cups
docker run -d --name="cups" --privileged="true" --restart always -e CUPS_USER_ADMIN="" -e CUPS_USER_PASSWORD="" -p 6631:631/tcp
-v /var/run/dbus:/var/run/dbus -v /dev/bus/usb:/dev/bus/usb -v /dev:/dev rabbired/cups
