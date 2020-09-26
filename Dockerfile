FROM debian:10

#install dependancies
RUN apt-get update && apt-get full-upgrade -y && apt-get install nginx ffmpeg -y

#add nginx config
COPY nginx.conf /etc/nginx/sites-enabled/default

#add static content
COPY static /etc/static

#configure startup stuff
COPY start.sh .
RUN chmod +x start.sh
ENTRYPOINT ["./start.sh"]
