FROM debian:wheezy

MAINTAINER Joey Yore <joey@jyore.com>
RUN apt-get update && apt-get install -y cowsay fortune
COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
