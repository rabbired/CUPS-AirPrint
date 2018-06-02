# cups
docker run -d --name="cups" --net="host" --privileged="true" --restart always \
-v /var/run/dbus:/var/run/dbus -v /dev/bus/usb:/dev/bus/usb -v /dev:/dev redz/cups
