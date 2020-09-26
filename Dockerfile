FROM debian:10

#install dependancies
RUN apt-get update && apt-get full-upgrade -y && apt-get install nginx ffmpeg -y

#add nginx config
COPY nginx.conf /etc/nginx/sites-enabled/default

#add static content
COPY static /etc/static

#add SSL certificates
#only uncomment if you have SSL certificates in a directory named certs
#COPY certs /etc/certs

#configure startup stuff
COPY start.sh .
RUN chmod +x start.sh
ENTRYPOINT ["./start.sh"]
