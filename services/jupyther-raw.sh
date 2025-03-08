#PORT=10003
#DIR=/redundant/work/workspace-13f
#DIR=/redundant/work/datacrunch/
#TOKEN=


docker run -d --rm \
  --name "jupyther-$PORT" \
  -p $PORT:8888 \
  -e JUPYTER_ENABLE_LAB=yes \
  -v "$DIR":/home/jovyan/work \
  --memory=30g \
  --label "com.centurylinklabs.watchtower.enable=false" \
  jupyter/datascience-notebook:python-3.8.6 \
  start-notebook.sh --NotebookApp.token="$TOKEN"
