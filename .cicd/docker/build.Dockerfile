FROM ubuntu:latest
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git python python3 lbzip2 curl wget python3-setuptools \
    glib-2.0 libgtk-3-dev bison cdbs curl flex g++ pkg-config -yqq \
    && apt-get clean
WORKDIR /home/v8
CMD python3 deps/build.py