#!/bin/bash

chown -R idies:idies /home/idies/workspace/persistent || true
chown -R idies:idies /home/idies/workspace/scratch || true
rm -f /tmp/.X1-lock

export PATH=/home/idies/anaconda3/bin:$PATH

sudo -u idies /usr/bin/Xvfb :1 -screen 0 1024x768x24 &

sudo -u idies env PATH=$PATH jupyter notebook \
    --no-browser \
    --ip=* \
    --notebook-dir=/home/idies/workspace \
    --NotebookApp.token='' \
    --NotebookApp.base_url=$1
