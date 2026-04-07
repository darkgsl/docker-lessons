# FROM nginx:1.28.3-alpine-slim
FROM alpine:3.23.3

ARG BLD_RELEASE=1.0
ARG NGINX_VERSION=1.28.3-r0
ARG MODE=440

ENV IMG_RELEASE=${BLD_RELEASE}



RUN echo "BUILD RELEASE ${BLD_RELEASE}" && \
apk update && \
apk add --no-cache nginx=${NGINX_VERSION} && \
install -d -m 755 -o nginx -g root /opt/data

WORKDIR /opt/data

COPY --chown=nginx:root --chmod=${MODE} src/ .
COPY default.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/

USER nginx

EXPOSE 8080

# в Dockerfile
HEALTHCHECK --interval=30s  --timeout=3s --retries=3 --start-period=10s\
  CMD ["wget", "--no-verbose", "--tries=1", "--spider", "http://127.0.0.1:8080"]

CMD ["nginx", "-g", "daemon off;"]