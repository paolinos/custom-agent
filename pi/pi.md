


```
podman build -t pi -f ./Pi.Dockerfile .


podman build -t pi -f ./pi/Pi.Dockerfile ./pi



podman run -it --rm --add-host=host.containers.internal:host-gateway --name pi -v $(PWD):/app pi pi
```
