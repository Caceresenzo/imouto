docker run -d \
  --name=grafana \
  --link influxdb \
  -p 3000:3000 \
  -v /storage/internal/config/grafana:/var/lib/grafana \
  --restart unless-stopped \
  grafana/grafana
