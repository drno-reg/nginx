#!/bin/sh
export ANSIBLE_CONFIG="ansible/ansible.cfg"
docker stop service2_ui && docker rm service2_ui
docker build -t drnoreg/service_ui:0.0.1 -f proxy_pass/docker/service-ui/Dockerfile ./
docker run -d --name service2_ui \
-p 8080:8080 \
--net smart_alert_network \
--net-alias service2_ui \
-v "$PWD/logs:/var/log/nginx"  \
drnoreg/service2_ui:0.0.1

