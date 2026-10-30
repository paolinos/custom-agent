FROM ubuntu:26.10

RUN apt-get update && apt-get install -y curl nodejs make rustc cargo

RUN curl -fsSL https://opencode.ai/v2/install | bash

ENV PATH="/root/.opencode/bin:$PATH"


WORKDIR /app

COPY ./opencode.json /root/.config/opencode/opencode.json

COPY ./agents /root/.config/opencode/agents
