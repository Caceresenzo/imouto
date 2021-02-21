docker run -d \
  --name=grafana \
  --link influxdb \
  -p 3000:3000 \
  -v /redundant/internal/config/grafana:/var/lib/grafana \
  -v /redundant/internal/config/grafana/grafana.ini:/etc/grafana/grafana.ini \
  --restart unless-stopped \
  grafana/grafana
