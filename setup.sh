#!/bin/bash

# -------- CONFIG --------
WALLET="nano_3wap3c7doks9oqejx3gnnoccq17eju7kq8tri9hmha3jopcahtzucj5e7zsa"
POOL="xmrig.nanswap.com:3333"
ALGO="rx"
THREADS=4
# ------------------------

echo "[+] Cập nhật hệ thống & cài đặt gói cần thiết..."
sudo apt update && sudo apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev screen

echo "[+] Tải XMRig..."
git clone https://github.com/xmrig/xmrig.git
cd xmrig

echo "[+] Tạo thư mục build..."
mkdir build && cd build

echo "[+] Biên dịch XMRig..."
cmake ..
make -j$THREADS

echo "[+] Bắt đầu đào Nano với ví: $WALLET (sử dụng $THREADS threads)"
./xmrig -o $POOL -a $ALGO -k -u $WALLET -p x -t $THREADS
