
FROM nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
