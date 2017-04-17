FROM armhf/python:3.6-slim 
MAINTAINER evanlezar@gmail.com

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
	wget

RUN pip install speedtest-cli

RUN wget https://raw.githubusercontent.com/elezar/speedtest-cli-extras/master/bin/speedtest-csv -O /usr/bin/speedtest-csv
RUN chmod o+x /usr/bin/speedtest-csv

ENTRYPOINT ["/usr/bin/speedtest-csv"]

CMD ["--sep", ";", "--no-share", --quote, "\""]
