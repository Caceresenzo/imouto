docker run -d \
  --name filebrowser \
  -p 5082:8080 \
  -v /redundant/drive/:/data \
  -v /redundant/internal/config/filebrowser/:/config \
  -e FB_BASEURL=/ \
  --restart unless-stopped \
  hurlenko/filebrowser
