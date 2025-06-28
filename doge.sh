#!/bin/bash
# Script đào DOGE bằng xmrig qua unMineable
# Worker name: AWM-S1

# Cập nhật hệ thống và cài các gói cần thiết
sudo apt update
sudo apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

# Tải và build xmrig
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build && cd build
cmake ..
make -j$(nproc)

# Chạy xmrig để đào DOGE
./xmrig -o rx.unmineable.com:3333 -a rx -k -u DOGE:DNkYdF4a66hAWM1tKKcGM5Y6BFwM8V65F4.AWM-S1 -p x
