docker run -d \
  --name telegraf \
  --net=host \
  -v /storage/internal/config/telegraf/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
  --restart unless-stopped \
  telegraf
