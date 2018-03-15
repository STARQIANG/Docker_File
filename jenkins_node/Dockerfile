FROM maven

ENV LANG C.UTF-8
COPY  sources.list /etc/apt/sources.list
RUN apt-get  update --allow-insecure-repositories \
   && apt-get  autoremove -y openssh-client openssh-server \
   && apt-get install -y --allow-unauthenticated openssh-server  \
   && apt-get install -y --allow-unauthenticated supervisor \
   && sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
   &&  sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
   && echo "root:123456" | chpasswd \
   && mkdir  /var/run/sshd
EXPOSE 22

COPY sshd.conf /etc/supervisor/conf.d/sshd.conf
COPY docker-entrypoint.sh /entrypoint.sh
RUN chmod -v +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/bin/supervisord"]