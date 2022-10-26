#!/bin/sh
export ANSIBLE_CONFIG="ansible/ansible.cfg"
docker stop proxy_web && docker rm proxy_web
docker build -t drnoreg/proxy_web:0.0.1 -f proxy_pass/docker/proxy/Dockerfile ./
docker run -d --name proxy_web \
-p 81:81 \
--net smart_alert_network \
--net-alias proxy_web \
-v "$PWD/logs:/var/log/nginx"  \
drnoreg/proxy_web:0.0.1

