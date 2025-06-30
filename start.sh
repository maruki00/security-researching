
#!/bin/sh
docker run --rm -v "$(pwd)/host:/host" -v "$(pwd)/logs:/logs" --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -d --name security-research -i  security-researsh:ubuntu23.04

