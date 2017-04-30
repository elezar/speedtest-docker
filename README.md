## Speedtest

This project sets up a simple internet speed logger. The test itself is performed by a Docker container running the [speedtest-cli](https://github.com/sivel/speedtest-cli) utility. In order to provide flexible logging, [Fluentd](http://www.fluentd.org/) is used to capture the Docker ouput. The configured Fluentd images defaults to outputing the captured logs to STDOUT and POSTing to an HTTP endpoint configured through an envirionment variable.




See http://makezine.com/projects/send-ticket-isp-when-your-internet-drops/
