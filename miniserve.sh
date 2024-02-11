docker run \
  --name miniserve \
  -v /storage:/storage/:ro \
  -p 8999:8080 \
  --rm -d \
  docker.io/svenstaro/miniserve \
  /storage
