#!/bin/bash

chown idies:idies /home/idies/workspace/persistent || true
chown idies:idies /home/idies/workspace/scratch || true
rm -f /tmp/.X1-lock

cd /home/idies/workspace/persistent && if cd mede_example_notebooks; then git pull; else git clone https://github.com/mededsc/mede_example_notebooks.git; fi

chown -R idies:idies /home/idies/workspace/persistent/mede_example_notebooks || true

export PATH=/home/idies/anaconda3/bin:$PATH

sudo -u idies /usr/bin/Xvfb :1 -screen 0 1024x768x24 &

sudo -u idies env PATH=$PATH jupyter notebook \
    --no-browser \
    --ip=* \
    --notebook-dir=/home/idies/workspace \
    --NotebookApp.token='' \
    --NotebookApp.base_url=$1
