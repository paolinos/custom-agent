FROM node:current-alpine3.24

RUN apk add curl go make

RUN npm install -g @nubjs/nub
RUN npm install -g little-coder

RUN export SAFE_PREFIXES="/usr/bin:/usr/local/bin"

# ENV LITTLE_CODER_PERMISSION_MODE="accept-all"
# Allowing more tools
ENV LITTLE_CODER_BASH_ALLOW="cd , npm , nub , curl , go , make "

ENV LMSTUDIO_BASE_URL="http://host.containers.internal:1234/v1"

COPY ./little-coder.models.json /root/.config/little-coder/models.json

WORKDIR /app
