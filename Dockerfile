FROM debian:bookworm-slim
ENV LC_CTYPE C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
RUN useradd -ms /bin/bash user
RUN apt-get update && \
apt-get install -y build-essential \
        jq strace ltrace curl wget \ 
        rubygems gcc dnsutils binwalk\
        netcat-traditional gcc-multilib \
        net-tools vim gdb gdb-multiarch binutils binutils\
        python3-full python3-pip python3-dev \
        libssl-dev libffi-dev wget git make \
        procps libpcre3-dev libdb-dev \
        libxt-dev libxaw7-dev  tmux file && \
pip3 install --break-system-packages capstone \
        requests pwntools r2pipe \
        keystone-engine unicorn \
        ropper meson ninja && \
        cp /usr/bin/python3 /usr/bin/python && \
mkdir /tools && \
cd /tools && git clone https://github.com/JonathanSalwan/ROPgadget && \
wget -O /home/user/.gdbinit-gef.py -q https://gef.blah.cat/py && \
echo source /home/user/.gdbinit-gef.py >> /home/user/.gdbinit && \
cd /tools && git clone --recurse-submodules https://github.com/rizinorg/rizin && \
cd rizin && meson build && ninja -C build && ninja -C build install
USER user
WORKDIR /home/user
COPY re /home/user/re
COPY binexp /home/user/binexp
WORKDIR /home/user
CMD ["/bin/bash"]
