FROM buildpack-deps:stretch

MAINTAINER Tamnil Saito Junior <tamnil@gmail.com>

RUN apt-get update && apt-get install -y \
    nginx \
    vim


ADD nginx.conf /etc/nginx/
ADD mysite.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/mysite.conf /etc/nginx/sites-enabled/mysite \
&& rm /etc/nginx/sites-enabled/default

# RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443

