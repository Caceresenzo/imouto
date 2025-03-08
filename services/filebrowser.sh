docker run -d \
  --name filebrowser \
  -p 5082:8080 \
  -v /storage/:/data:ro \
  -v /redundant/internal/configuration/filebrowser/:/config \
  -e FB_BASEURL=/ \
  --restart unless-stopped \
  hurlenko/filebrowser
