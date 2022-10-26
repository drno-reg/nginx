#!/bin/sh
export ANSIBLE_CONFIG="ansible/ansible.cfg"
docker stop service_ui && docker rm service_ui
docker build -t drnoreg/service_ui:0.0.1 -f proxy_pass/docker/service-ui/Dockerfile ./
docker run -d --name service_ui \
-p 8181:8181 \
--net smart_alert_network \
--net-alias service_ui \
-v "$PWD/logs:/var/log/nginx"  \
drnoreg/service_ui:0.0.1

