 docker run -d \
  --name influxdb \
  -v /redundant/internal/database/influxdb:/var/lib/influxdb \
  -p 8086:8086 \
  --restart unless-stopped \
  influxdb:1.8.4
