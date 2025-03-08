docker run -d \
  --name telegraf \
  --net=host \
  -e HOST_ETC=/hostfs/etc \
  -e HOST_PROC=/hostfs/proc \
  -e HOST_SYS=/hostfs/sys \
  -e HOST_MOUNT_PREFIX=/hostfs \
  -v /:/hostfs:ro \
  -v /etc:/hostfs/etc:ro \
  -v /proc:/hostfs/proc:ro \
  -v /sys:/hostfs/sys:ro \
  -v /storage/:/storage/:ro \
  -v /redundant/:/redundant/:ro \
  -v /redundant/internal/configuration/telegraf/telegraf.conf:/etc/telegraf/telegraf.conf:ro \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --label "com.centurylinklabs.watchtower.enable=false" \
  --restart unless-stopped \
  telegraf
