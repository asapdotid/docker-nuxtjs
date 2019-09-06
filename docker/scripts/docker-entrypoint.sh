#!/bin/sh
set -e

apk add --no-cache curl git && cd /tmp && \
curl -#L https://github.com/tj/node-prune/releases/download/v1.0.1/node-prune_1.0.1_linux_amd64.tar.gz | tar -xvzf- && \
mv -v node-prune /usr/local/bin && rm -rvf * && \
echo "yarn cache clean && node-prune" > /usr/local/bin/node-clean && chmod +x /usr/local/bin/node-clean

cd /app

yarn --frozen-lockfile --non-interactive

yarn build

yarn --frozen-lockfile --non-interactive --production && node-clean

yarn start

# Call command issued to the docker service
exec "$@"