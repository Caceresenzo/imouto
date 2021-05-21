docker run -it \
  --name chia \
  --restart unless-stopped \
  -v /redundant/internal/config/chia/:/root/.chia \
  -v /storage-unsafe/chia/tmp:/tmp \
  -v /storage-unsafe/chia/plots:/plots \
  -v /redundant/internal/config/chia/keys_enzo:/keys_enzo:ro \
  -e keys="/keys_enzo" \
  ghcr.io/chia-network/chia:latest

# -v /redundant/internal/config/chia/python_keyring/:/root/.local/share/python_keyring/ \

