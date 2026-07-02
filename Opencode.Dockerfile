FROM oven/bun:alpine

RUN bun add -g opencode-ai

# For Golang integrations
# apk add go
RUN apk add curl nodejs

WORKDIR /app

COPY ./opencode.json /root/.config/opencode/opencode.json

COPY ./agents /root/.config/opencode/agents
