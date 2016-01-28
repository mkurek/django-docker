#!/bin/bash
cd $BLOG_DIR
sleep 10  # give db some time to run
python3 manage.py migrate --noinput
python3 manage.py loaddata blog/blog/fixtures/initial_data.json
python3 manage.py collectstatic --noinput

# pass the error (ex. when user already exist);
# by muting the error, this script could be use to upgrade data container too
python3 manage.py createsuperuser --noinput --username admin --email="octo@docker.com" || true
python3 $BLOG_DIR/createsuperuser.py
