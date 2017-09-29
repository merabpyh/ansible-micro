#!/bin/bash

docker run \
	-d \
	-p 80:80 \
	-v /var/run/docker.sock:/tmp/docker.sock:ro \
	--name proxy \
	jwilder/nginx-proxy:alpine
