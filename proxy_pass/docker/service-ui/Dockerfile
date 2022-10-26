FROM nginx:latest

#change timezone on Moskow
ENV TZ=Europe/Moscow
RUN apt-get update && apt-get install -yy tzdata
RUN cp /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

WORKDIR /app

COPY src/service-ui/ .

COPY proxy_pass/docker/service-ui/conf.d/* /etc/nginx/conf.d/http/
COPY proxy_pass/docker/nginx.conf /etc/nginx/nginx.conf


CMD ["nginx", "-g", "daemon off;"]