#PORT=10003
#DIR=/redundant/work/workspace-13f
#DIR=/redundant/work/datacrunch/

docker run -d \
  --name "jupyter-$PORT" \
  -p $PORT:8888 \
  -e JUPYTER_ENABLE_LAB=yes \
  -e UID=0 \
  -u root \
  -e NB_GID=1003 \
  -e GRANT_SUDO=yes \
  -v "$DIR":/home/jovyan/work \
  --memory=105g \
  --label "com.centurylinklabs.watchtower.enable=false" \
  jupyter/datascience-notebook:python-3.9.6
