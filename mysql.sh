docker run -d \
  --name mysql \
  -v /storage/internal/database/mysql:/var/lib/mysql \
  -e MYSQL_ROOT_PASSWORD=password \
  -p 3306:3306 \
  mysql:5.7
