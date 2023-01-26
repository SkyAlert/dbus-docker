FROM alpine:latest

RUN apk add --no-cache dbus
VOLUME ["/run/dbus"]
ENV SOCKET_NAME="bus_socket"
ENV ADDRESS="unix:path=/run/dbus/${SOCKET_NAME}"
# sh -c needed for ENVs
ENTRYPOINT ["/bin/sh", "-c", "exec /usr/bin/dbus-daemon --address=${ADDRESS} --nofork ${@}", "--"]
CMD ["--session"]
