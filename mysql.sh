docker run -d \
  --name mysql \
  -v /redundant/internal/database/mysql:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=password \
  -p 3306:3306 \
  --label "com.centurylinklabs.watchtower.enable=false" \
  mysql:5.7
