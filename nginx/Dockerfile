#  安装nginx1.12.0

FROM centos7:tools


USER root

RUN  rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm && \
yum -y install nginx && \
yum clean all && \
rm -fr /var/cache/*
COPY docker-entrypoint.sh /entrypoint.sh
COPY custom.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf
COPY reverse-proxy.conf    /etc/nginx/conf.d/
ENV PROXY_HOSTS 127.0.0.1:8080;

RUN chmod -v +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80
COPY supervisord.conf /etc/supervisor/conf.d/nginx.conf
CMD ["/usr/bin/supervisord"]
## docker build . -t centos7:nginx
