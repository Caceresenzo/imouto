docker run -d \
  --name phpmyadmin \
  -e PMA_HOST=mysql \
  -p 5050:80 \
  --link mysql \
  --restart unless-stopped \
  phpmyadmin
