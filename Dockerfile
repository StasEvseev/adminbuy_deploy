FROM ubuntu:16.04

MAINTAINER stasevseev@gmail.com

RUN apt-get update -y
RUN apt-get install -y python2.7 python-setuptools supervisor git build-essential gcc libxml2-dev libxslt1-dev \
    libpq-dev python2.7-dev libjpeg-dev

RUN easy_install pip

WORKDIR /var/local/www/
RUN git clone -b 0.9 https://github.com/StasEvseev/adminbuy.git
WORKDIR /var/local/www/adminbuy
RUN pip install -r REQUIREMENTS

EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/gunicorn", "-w", "2", "-b", "0.0.0.0:8000", "app:app"]
