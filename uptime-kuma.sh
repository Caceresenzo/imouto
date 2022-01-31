docker run -d \
  --restart=unless-stopped \
  -p 3001:3001 \
  -v /redundant/internal/config/uptime-kuma:/app/data \
  --name uptime-kuma \
  louislam/uptime-kuma:latest
