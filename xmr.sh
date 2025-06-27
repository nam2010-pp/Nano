#!/bin/bash

# -------- CONFIG --------
WALLET="4A8s5SdfZh1eckUppAB5h9TzWo3LD3cqPWdMcD5LUiAFACuUFDZWTqP81gwUCnnCKi2wGDZC8rXJWXJCe7D37WoiFTGkk7P"
POOL="xmrig.nanswap.com:3333"
ALGO="rx"
THREADS=4
# ------------------------

echo "[+] Cập nhật hệ thống & cài đặt gói cần thiết..."
sudo apt update && sudo apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev screen

echo "[+] Tải mã nguồn XMRig..."
git clone https://github.com/xmrig/xmrig.git
cd xmrig

echo "[+] Tạo thư mục build..."
mkdir build && cd build

echo "[+] Đang biên dịch XMRig..."
cmake ..
make -j$THREADS

echo "[✓] Đã sẵn sàng. Bắt đầu đào XMR bằng ví: $WALLET"
./xmrig -o $POOL -a $ALGO -k -u $WALLET -p x -t $THREADS
