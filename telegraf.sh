docker run -d \
  --name telegraf \
  --net=host \
  -v /storage/internal/config/telegraf/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
  --label "com.centurylinklabs.watchtower.enable=false" \
  --restart unless-stopped \
  telegraf
