FROM debian

RUN apt-get update && apt-get install -y octave wget unzip vim less

ADD . /app/
