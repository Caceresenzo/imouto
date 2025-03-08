docker run -d \
  --name=flaresolverr \
  -e LOG_LEVEL=info \
  -e CAPTCHA_SOLVER=hcaptcha-solver \
  -p 8191:8191 \
  --restart=unless-stopped \
  ghcr.io/flaresolverr/flaresolverr:latest
