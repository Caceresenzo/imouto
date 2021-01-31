docker run -d --rm \
  -p 10000:8888 \
  -e JUPYTER_ENABLE_LAB=yes \
  -v /storage/work/datacrunch/factset/storage/:/home/jovyan/factset \
  -v /storage/work/jupyter/:/home/jovyan/work \
  jupyter/datascience-notebook:python-3.8.6

#  -v /storage/work/datacrunch/:/home/jovyan/datacrunch
