FROM alpine:latest

RUN apk add --no-cache dbus
ENV SOCKET_NAME="socket"
ENV ADDRESS="unix:path=/tmp/dbus/${SOCKET_NAME}"
RUN mkdir /tmp/dbus
# sh -c needed for ENVs
ENTRYPOINT ["/bin/sh", "-c", "exec /usr/bin/dbus-daemon --address=${ADDRESS} --nofork ${@}", "--"]
CMD ["--session"]
