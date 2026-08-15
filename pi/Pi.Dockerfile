FROM node:current-alpine3.24

RUN apk add curl go make


RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent

# Add skill
# RUN pi install npm:@alchemiststudios/pi-harness-skills


WORKDIR /app

COPY ./pi.json /root/.pi/agent/models.json
