# STAGE 1: Build
FROM alpine:latest AS build

# Install Stuff
RUN	apk update && \ 
	apk upgrade && \
	apk add --no-cache \
		bash \
		git \
		php7 \
		php7-dom \
		php7-gd \
		php7-pdo \
		php7-session \
		php7-simplexml \
		php7-tokenizer \
		php7-xml \
		php7-curl \
		php7-xmlwriter \
		php7-json \
		nfs-utils \
		composer \
		wget \
		nginx


## Get dependencies for Go part of build
#RUN go get -u github.com/jteeuwen/go-bindata/...
#RUN go get github.com/tools/godep

WORKDIR /var/www

RUN rm -rf /var/www/*
RUN git clone https://github.com/drupal/recommended-project.git .
RUN composer update
