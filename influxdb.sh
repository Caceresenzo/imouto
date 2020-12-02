 docker run -d \
  --name influxdb \
  -v /storage/internal/database/influxdb:/var/lib/influxdb \
  -p 8086:8086 \
  --restart unless-stopped \
  influxdb
