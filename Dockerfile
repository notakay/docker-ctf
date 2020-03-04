FROM archlinux/base  
RUN pacman -Syu --noconfirm && \
pacman -S base-devel cmake gdb gnu-netcat git python-pip --noconfirm && \
mkdir tools && cd tools && \
# Get Radare2 stuff
git clone https://github.com/radare/radare2 && cd radare2 && sys/user.sh && \
/root/bin/r2pm init && \
/root/bin/r2pm -i r2ghidra-dec && \
pip install --upgrade r2pipe && \
# Get pwn tools
pip install --upgrade git+https://github.com/Gallopsled/pwntools.git@dev
