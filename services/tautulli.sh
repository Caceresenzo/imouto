docker run -d \
  --name=tautulli \
  --restart=unless-stopped \
  -p 8181:8181 \
  -v /redundant/internal/config/tautulli:/config \
  ghcr.io/tautulli/tautulli
