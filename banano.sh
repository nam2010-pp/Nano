#!/bin/bash
# Auto install & run XMRig to mine Banano via Nanswap pool

# Step 1: Update hệ thống
sudo apt update && sudo apt upgrade -y

# Step 2: Cài các gói cần thiết
sudo apt install git build-essential cmake libuv1-dev libssl-dev libhwloc-dev -y

# Step 3: Clone xmrig
git clone https://github.com/xmrig/xmrig.git
cd xmrig

# Step 4: Build
mkdir build && cd build
cmake ..
make -j$(nproc)

# Step 5: Chạy đào Banano
./xmrig -o xmrig.nanswap.com:3333 -a rx -k -u ban_3u3684rwhz8oqazhsi7aepdho7gd3dwisusj7ztwua8uk7zcrhsnqrthyrck -p x -t 4
