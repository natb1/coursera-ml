FROM debian

RUN apt-get update && apt-get install -y octave wget unzip vim less curl

ADD . /usr/src
WORKDIR /usr/src
