docker run -d \
  --name=grafana \
  -p 3000:3000 \
  -v /redundant/internal/configuration/grafana:/var/lib/grafana \
  -v /redundant/internal/configuration/grafana/grafana.ini:/etc/grafana/grafana.ini \
  --restart unless-stopped \
  grafana/grafana
