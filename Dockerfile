FROM ubuntu:15.04
MAINTAINER mateusz@mkurek.com

# basic provisioning
ADD . /home/blog/src
RUN /home/blog/src/docker/provision.sh
RUN pip3 install -r /home/blog/src/requirements/production.txt

EXPOSE 22 8001
CMD python3 /home/blog/src/manage.py runserver 0.0.0.0:8001
