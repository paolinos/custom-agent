# Littlecoder



```
podman build -t little-coder -f ./LittleCoder.Dockerfile .

podman build -t little-coder --no-cache -f ./LittleCoder.Dockerfile .



podman run -it --rm --add-host=host.containers.internal:host-gateway --name little-coder -v $(PWD):/app little-coder little-coder
```
