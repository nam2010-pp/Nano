#!/bin/bash

# ====== CẤU HÌNH ======
WALLET="Xq4SuvFwAFRs9nrJLk2WWbuqYgauxbxAep"  # Địa chỉ ví Dash của bạn
WORKER="awm_s1"
THREADS=$(nproc)  # Tự động lấy số CPU core

# ====== CÀI GÓI BUILD ======
echo "[*] Cài gói build cần thiết..."
sudo apt update
sudo apt install -y git build-essential cmake libuv1-dev libssl-dev libhwloc-dev

# ====== CLONE XMRig ======
echo "[*] Tải mã nguồn XMRig..."
git clone https://github.com/xmrig/xmrig.git
cd xmrig
mkdir build && cd build

# ====== CẤU HÌNH BUILD ======
echo "[*] Đang cấu hình build..."
cmake .. -DWITH_HWLOC=ON -DCMAKE_BUILD_TYPE=Release

# ====== BIÊN DỊCH ======
echo "[*] Bắt đầu biên dịch XMRig..."
make -j$THREADS

# ====== CHẠY ĐÀO DASH QUA UNMINEABLE ======
echo "[*] Đào DASH gửi về ví $WALLET ..."
./xmrig -o rx.unmineable.com:3333 -a rx -k \
  -u DASH:$WALLET.$WORKER -p x \
  -t $THREADS
