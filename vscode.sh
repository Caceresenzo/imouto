docker run -d \
  --name="vscode-$PORT" \
  -e PROXY_DOMAIN="$NAME.vscode.imouto.caceresenzo.dev" \
  -e PASSWORD=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 100 ; echo '') \
  -e SUDO_PASSWORD=password \
  -p $PORT:8443 \
  -p $PORT2:8888 \
  -v /redundant/workspace/vscode/"$NAME":/config \
  lscr.io/linuxserver/code-server
