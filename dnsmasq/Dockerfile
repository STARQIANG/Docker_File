#  安装openjdk

FROM alpine:3.4

RUN apk --no-cache add dnsmasq
EXPOSE 53 53/udp


COPY resolv.dnsmasq /etc/
COPY dnsmasqhosts  /etc/
RUN echo "resolv-file=/etc/resolv.dnsmasq" >> /etc/dnsmasq.conf \
&&  echo "addn-hosts=/etc/dnsmasqhosts" >> /etc/dnsmasq.conf

ENTRYPOINT ["dnsmasq", "-k"]

# docker build . -t andyshinn:dnsmasq
