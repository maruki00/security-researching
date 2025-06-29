FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

# Update and install essential packages
RUN apt update && apt install -y \
    build-essential \
    gdb \
    python3 \
    python3-pip \
    git \
    curl \
    wget \
    ca-certificates \
    nasm \
    libc6 \
    libc6-dev \
    libc6-dbg \
    make \
    && rm -rf /var/lib/apt/lists/*

# Install GEF (GDB Enhanced Features)
RUN bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

# Configure GEF as default
RUN echo "source ~/.gef.rc" >> ~/.gdbinit

# Set working directory and copy all files from local build context
WORKDIR /app
COPY . /app

# Set default command to interactive shell
ENTRYPOINT ["/bin/bash"]

