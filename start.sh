#!/bin/bash

nginx
ffmpeg -listen 1 -i "rtmp://0.0.0.0" -b:v:0 10000k -b:v:1 512k -b:v:2 256k -b:a:0 256k -b:a:1 128k -b:a:2 64k -g 60 -hls_time 2 -hls_list_size 0 -map 0:v -map 0:a -map 0:v -map 0:a -map 0:v -map 0:a -master_pl_name stream.m3u8 -var_stream_map "v:0,a:0 v:1,a:1 v:2,a:2" /etc/static/q_%v.m3u8

#uncomment next line if you don't want the container to stop after the stream ends
#sleep 9999999
