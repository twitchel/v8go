FROM ubuntu:latest
RUN apt-get update
#RUN ln -fs /usr/share/zoneinfo/Australia/Sydney /etc/localtime
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y git python python3 lbzip2 curl wget glib-2.0 && apt-get clean
WORKDIR /home/v8
CMD python3 deps/build.py