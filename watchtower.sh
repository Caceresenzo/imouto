docker run -d \
  --name watchtower \
  -e WATCHTOWER_SCHEDULE="0 0 6 * * *" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --restart unless-stopped \
  containrrr/watchtower
