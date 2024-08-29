FROM ubuntu:22.04
MAINTAINER Anton Mayko <antonmayko@mail.ru>
RUN  apt -y update && apt install -y nginx
RUN  rm -rf /var/www/html/*
COPY index.html /var/www/html
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80
CMD [ "nginx" ]