#!/bin/bash

echo "📦 Update & install dependencies..."
apt-get update && apt-get install -y screen git wget

echo "🌐 Clone repo ke /root/web..."
rm -rf /root/web
git clone https://github.com/amirul5656/web.git /root/web

echo "🔧 Pastikan web2.sh executable..."
chmod +x /root/web/web2.sh

echo "🔍 Cek screen amirul3..."
if screen -list | grep -q amirul3; then
  echo "⚠️ Screen 'amirul3' sudah berjalan, skip menjalankan ulang."
else
  echo "▶ Menjalankan /root/web/web2.sh di screen 'amirul3'..."
  screen -dmS amirul3 bash -c '/root/web/web2.sh'
  echo "🚀 Mining berjalan di screen 'amirul3'."
fi
