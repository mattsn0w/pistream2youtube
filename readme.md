# Stream to YouTube with a Raspberry Pi 4 and a Pi Camera module
This is a simple streaming setup that took some investigation into ffmpeg, the Pi Camera options, and exact parameters for capturing a video stream from the pi camera and streaming it straight to YouTube.
Also containerizing the tools and devices. This way of the stream capture dies for some reason it will automatically restart.  

## Prerequisites
- RaspberryPi 4+
- [libcamera](https://libcamera.org/) compatible camera
- Raspbian 64-bit installed to the SD card.

## Configure Stream Key 
Create a live stream using [YouTube Studio](https://studio.youtube.com/) and get the stream key.  
Set the stream key in the `.env` file in the `YTS_KEY` variable.

## Build the container image
For now you need to run the `build_container.sh` script, or run `docker build -t debian-bullseye:raspistream .` in the directory where `Dockerfile` and `entrypoint.sh` are located.


## Docker Compose up
Make sure you get the latest docker-compose binary from https://github.com/docker/compose/.   
Then cd to the directory where your docker-compose.yml is and run `docker-compose up` to launch the container in interactive mode. Monitor the log output to ensure the capture from the camera is working and sending to youtube with ffmpeg.
