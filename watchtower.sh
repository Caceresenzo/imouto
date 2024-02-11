docker run -d \
  --name watchtower \
  -e WATCHTOWER_SCHEDULE="0 0 6 * * *" \
  -e WATCHTOWER_CLEANUP="true" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --restart unless-stopped \
  containrrr/watchtower
