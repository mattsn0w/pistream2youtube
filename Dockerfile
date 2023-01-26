FROM debian:bullseye

RUN apt-get update && \
    apt-get install curl gnupg ca-certificates lsb-release -y && \
    curl -fsSL http://archive.raspberrypi.org/debian/raspberrypi.gpg.key | gpg --dearmor -o /etc/apt/trusted.gpg.d/raspberrypi.gpg && \
    echo "deb http://archive.raspberrypi.org/debian/ bullseye main" > /etc/apt/sources.list.d/raspi.list

RUN apt-get update && \
    apt-get install ffmpeg wireguard libavcodec-extra winff-doc libjpeg-tools libcamera-apps libcamera-tools -y

COPY entrypoint.sh /

ENV YTS_KEY=${YTS_KEY}

ENTRYPOINT ["/entrypoint.sh"]
