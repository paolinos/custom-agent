# Open code in container + LM Studio/Ollama

Here we're preparing to run Opencode in container, for security concerns, and connect it to local Ollama or LM Studio using "Qwen3.5-9b"
To connect docker to local service, we use the `host-gateway` from docker/podman, and depends of what are you using there're different hosts:
```sh
# Docker
http://host.docker.internal

# Podman
http://host.containers.internal
```
So, if you're using podman, change the urls.


Remember to download "Qwen3.5-9b" or configure your local models in `opencode.json`
In this example we're using LM Studio. Before use it, download the model, and also modify the context to `16384` or bigger.

file `opencode.json`
```json
{
  "$schema": "https://opencode.ai/config.json",
  "provider": {
    "lmstudio": {
      "npm": "@ai-sdk/openai-compatible",
      "name": "LM Studio (local)",
      "options": {
        "baseURL": "http://host.docker.internal:1234/v1"
      },
      "models": {
        "qwen/qwen3.5-9b": {
          "name": "qwen3.5-9b"
        }
      }
    }
  }
}
```

file `Opencode.Dockerfile`
```sh
FROM oven/bun

RUN bun add -g opencode-ai

WORKDIR /app

COPY ./opencode.json /root/.config/opencode/opencode.json
```


Build the docker file
```sh
#
docker build -t opencode --no-cache -f ./Opencode.Dockerfile .
#
podman build -t opencode --no-cache -f ./Opencode.Dockerfile .
```

*Run container*
```sh
# Using Docker
docker run -it --rm --add-host=host.docker.internal:host-gateway --name opencode -v $(PWD):/app opencode opencode

# Using Podman
podman run -it --rm --add-host=host.containers.internal:host-gateway --name opencode -v $(PWD):/app opencode opencode
```

Inside the Opencode terminal:
- write `/models` and select the local Qwen3.5-9b (or version that you're using locally) 
- select the mode using the `tab` key.