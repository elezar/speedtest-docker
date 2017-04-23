FROM armhf/python:3.6-slim
MAINTAINER evanlezar@gmail.com

RUN pip install --upgrade speedtest-cli

CMD ["speedtest", "--json"]
