#!/bin/bash
cd $BLOG_DIR
sleep 10  # give db some time to run
python3 manage.py migrate --noinput
python3 manage.py loaddata blog/blog/fixtures/initial_data.json
