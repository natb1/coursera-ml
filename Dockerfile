FROM debian

RUN apt-get update && apt-get install -y octave wget unzip vim

ADD . /app/
