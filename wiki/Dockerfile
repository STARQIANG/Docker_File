
FROM yangzhenwei/centos7-tools


USER root
RUN  yum -y install tcl tcl-devel expect &&  yum clean all
RUN  groupadd  confluence  \
    &&  useradd -r -g confluence confluence \
    &&  usermod -a -G root confluence \
    &&  mkdir /confluence && chmod -R 775 /confluence
COPY wiki_build.sh  /confluence/wiki_build.sh
COPY atlassian-confluence-5.9.10-x64.bin /confluence/atlassian-confluence-5.9.10-x64.bin
RUN  chmod -R 775 /confluence/wiki_build.sh \
    &&  /confluence/wiki_build.sh
EXPOSE 8090  8000
copy supervisord.conf /etc/supervisor/conf.d/wiki.conf
COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["--","echo '欢迎 wiki'"]

## docker build . -t centos7:wiki
