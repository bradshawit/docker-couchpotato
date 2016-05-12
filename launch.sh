#! /bin/sh

set -e

python /opt/couchpotato/CouchPotato.py --data_dir /data/couchpotato --console_log &
wait
