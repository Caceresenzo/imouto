docker run -d \
  --name=portainer \
  -p 8000:8000 \
  -p 9000:9000 \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /redundant/internal/config/portainer:/data \
  --restart unless-stopped \
  portainer/portainer-ce
