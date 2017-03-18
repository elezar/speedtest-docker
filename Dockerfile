FROM armhf/python:3.6-slim 
MAINTAINER evanlezar@gmail.com

RUN pip install speedtest-cli

CMD speedtest-cli
