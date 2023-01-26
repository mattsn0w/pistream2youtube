#!/bin/bash

YTS_URL=rtmp://a.rtmp.youtube.com/live2

libcamera-vid --inline --nopreview -t 0 --width 1920 --height 1080 --framerate 30 --codec h264 -o - | \
  ffmpeg -f lavfi -i anullsrc=channel_layout=stereo:sample_rate=44100 -thread_queue_size 1024 \
    -use_wallclock_as_timestamps 1 -i pipe:0 -c:v copy -c:a aac -preset fast -strict experimental \
    -b:v 4500k -maxrate 4500k -bufsize 4500k -f flv ${YTS_URL}/${YTS_KEY}
