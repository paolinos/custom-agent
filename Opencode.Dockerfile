FROM oven/bun

RUN bun add -g opencode-ai

WORKDIR /app

COPY ./opencode.json /root/.config/opencode/opencode.json

COPY ./agents /root/.config/opencode/agents