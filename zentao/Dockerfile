#  安装zentao

FROM yangzhenwei/centos7-tools



USER root
COPY ZenTaoPMS.9.1.2.zbox_64.tar.gz /tmp/ZenTaoPMS.9.1.2.zbox_64.tar.gz

RUN     tar -xvzf  /tmp/ZenTaoPMS.9.1.2.zbox_64.tar.gz -C /opt/ \
  && rm -rf /tmp/ZenTaoPMS.9.1.2.zbox_64.tar.gz

COPY supervisord.conf /etc/supervisor/conf.d/zentao.conf
CMD ["/usr/bin/supervisord"]
## docker build . -t centos7:nexus

