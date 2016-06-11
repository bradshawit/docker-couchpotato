#! /bin/sh

set -e

cd /opt/couchpotato
git pull

python /opt/couchpotato/CouchPotato.py --data_dir /data/couchpotato --console_log &
wait
