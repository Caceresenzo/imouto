docker run -d \
  --name samba \
  --net=host \
  -p 139:139 \
  -p 445:445 \
  -p 137:137/udp \
  -p 138:138/udp \
  -v /storage:/storage \
  -v /redundant:/redundant \
  -e NMBD=true \
  --restart unless-stopped \
  dperson/samba \
  -n \
  -S \
  -g "map to guest = Bad User" \
  -s "storage;/storage;yes;no;yes;all;none;;comment1" \
  -s "redundant;/redundant;yes;no;yes;all;none;;comment1" \
  -w WORKGROUP
