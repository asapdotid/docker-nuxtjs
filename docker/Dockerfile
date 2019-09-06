FROM node:10-alpine AS builder

LABEL maintainer Asapdotid <asapdotid@gmail.com>

VOLUME [ "/app" ]
WORKDIR /app

ENV NODE_ENV production
ENV HOST 0.0.0.0

EXPOSE 3000

COPY ./scripts/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]