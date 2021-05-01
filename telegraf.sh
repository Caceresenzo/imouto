docker run -d \
  --name telegraf \
  --net=host \
  -v /storage/:/storage/:ro \
  -v /redundant/:/redundant/:ro \
  -v /redundant/internal/config/telegraf/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --label "com.centurylinklabs.watchtower.enable=false" \
  --restart unless-stopped \
  telegraf
