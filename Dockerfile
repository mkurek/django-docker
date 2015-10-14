FROM ubuntu:15.04
MAINTAINER mateusz@mkurek.com

# set UTF-8 locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# set paths
ENV BLOG_DIR=/home/blog/src
ENV SCRIPTS_PATH=$BLOG_DIR/docker
ENV STATIC_PATH=/home/blog/static

WORKDIR $BLOG_DIR

# basic provisioning
ADD docker/* $SCRIPTS_PATH/
RUN $SCRIPTS_PATH/provision.sh

# cleanup
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# install Python requirements
ADD requirements $BLOG_DIR/requirements
RUN pip3 install -r requirements/production.txt

ADD . $BLOG_DIR

VOLUME $STATIC_PATH

EXPOSE 22 8001
CMD /usr/local/bin/gunicorn blog.wsgi:application -b :8001
