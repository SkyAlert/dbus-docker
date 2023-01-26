FROM alpine:latest

RUN apk add --no-cache dbus
# have these two directories in mind. the line is commented however to avoid anonymous vols
# VOLUME ["/run/dbus", "/etc/dbus-1"]
ENV SOCKET_NAME="bus_socket"
ENV ADDRESS="unix:path=/run/dbus/${SOCKET_NAME}"
# sh -c needed for ENVs
ENTRYPOINT ["/bin/sh", "-c", "exec /usr/bin/dbus-daemon --address=${ADDRESS} --nofork ${@}", "--"]
CMD ["--session"]
