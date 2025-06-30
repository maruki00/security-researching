FROM ubuntu
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && \
apt-get install -y build-essential jq strace ltrace curl wget rubygems gcc dnsutils netcat-traditional gcc-multilib net-tools \
  vim gdb gdb-multiarch python3-full python3-pip python3-dev libssl-dev libffi-dev wget git make procps \
  libpcre3-dev libdb-dev libxt-dev libxaw7-dev emacs-nox tmux && \
pip3 install --break-system-packages capstone requests pwntools r2pipe keystone-engine unicorn ropper meson ninja && \
mkdir /tools && \
cd /tools && git clone https://github.com/JonathanSalwan/ROPgadget && \
cd /tools && git clone https://github.com/niklasb/libc-database && \
cd /tools && git clone https://github.com/hugsy/gef && \
wget -O /root/.gdbinit-gef.py -q https://raw.githubusercontent.com/hugsy/gef/main/gef.py && \
echo source /root/.gdbinit-gef.py >> /root/.gdbinit && \ 
cd /tools && git clone --recurse-submodules https://github.com/rizinorg/rizin && \
cd rizin && meson build && ninja -C build && ninja -C build install
