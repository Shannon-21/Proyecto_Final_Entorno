FROM debian
MAINTAINER Shannon "fabiogiampaoli21@gmail.com"

ADD . /home

WORKDIR /home

ENTRYPOINT bash selection.sh

