FROM mhart/alpine-node
MAINTAINER puluto@gmail.com

ENV KIBANA_VERSION 4.3.3

RUN apk add --update curl && \
  ( curl -Lskj https://download.elastic.co/kibana/kibana/kibana-${KIBANA_VERSION}-linux-x64.tar.gz | \
  gunzip -c - | tar xf - ) && \
  mv /kibana-$KIBANA_VERSION-linux-x64 /kibana && \
  rm -rf /kibana/node && \
  rm /kibana/bin/*.bat && \
  cd /kibana && \
  npm i hapi-auth-cookie@3.1.0 && \
  bin/kibana plugin --install kibana-auth-plugin -u https://github.com/puluto/kibana-auth-plugin/archive/master.tar.gz && \
  apk del curl && \
  rm -rfv /var/cache/apk/* /tmp/* /var/tmp/* /root/.npm

ENV PATH /kibana/bin:$PATH

COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

EXPOSE 5601
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/kibana/bin/kibana"]
