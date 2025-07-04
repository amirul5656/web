#!/bin/bash
echo "📦 Menginstal dependensi..."
apt-get update && apt-get install -y screen wget tar

echo "📁 Menyimpan skrip mining ke /root/sugar.sh..."
cat << 'EOF' > /root/sugar.sh
#!/bin/bash

cd /root || exit

# Download miner jika belum ada
if [ ! -f benchmarks ]; then
  echo "⬇️ Mengunduh file benchmarks..."
  wget -O amirul https://raw.githubusercontent.com/amirul5656/web1/refs/heads/main/owada
  chmod +x amirul
fi

# Cek apakah screen sudah berjalan
if screen -list | grep -q amirul3; then
  echo "⚠️  Screen 'amirul3' sudah jalan, skip."
else
  echo "▶ Menjalankan mining di screen 'amirul3'..."
  screen -dmS amirul3 bash -c '
    while true; do
      ./amirul --disable-gpu --algorithm verushash --pool stratum+ssl://ap.vipor.net:5140 --wallet RQdUotwPueFvRY5xKfn6REsMUsBdhhmqdq --password c=DOGE -t 7
      sleep 2
    done
  '
fi
EOF

chmod +x /root/sugar.sh

echo "🚀 Menjalankan miner sekarang..."
bash /root/sugar.sh

echo "✅ Siap! Mining aktif sekarang & otomatis jalan setelah reboot lewat /etc/rc.local."
