#!/bin/bash

nginx
ffmpeg -listen 1 -i "rtmp://0.0.0.0" -g 60 -hls_time 2 -hls_list_size 0 -master_pl_name stream.m3u8 /etc/static/q_%v.m3u8

#uncomment next line if you don't want the container to stop after the stream ends
#sleep 9999999
