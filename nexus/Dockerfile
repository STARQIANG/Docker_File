#  安装openjdk

FROM yangzhenwei/centos7-jdk

LABEL vendor=Sonatype \
  com.sonatype.license="Apache License, Version 2.0" \
  com.sonatype.name="Nexus Repository Manager OSS base image"

ENV SONATYPE_WORK /sonatype-work
ENV NEXUS_VERSION 2.14.1-01

COPY nexus-2.14.1-01-bundle.tar.gz /tmp/nexus-2.14.1-01-bundle.tar.gz

RUN mkdir -p /opt/sonatype/nexus \
  && tar -xvzf  /tmp/nexus-2.14.1-01-bundle.tar.gz -C /tmp/ \
  && mv /tmp/nexus-${NEXUS_VERSION}/* /opt/sonatype/nexus/ \
  && rm -rf /tmp/nexus-${NEXUS_VERSION}

USER root

VOLUME ${SONATYPE_WORK}

EXPOSE 8080 80
WORKDIR /opt/sonatype/nexus
USER nexus
ENV CONTEXT_PATH /nexus
ENV APPLICATION_PORT 8080
ENV MAX_HEAP 768m
ENV MIN_HEAP 256m
ENV JAVA_OPTS -server -Djava.net.preferIPv4Stack=true
ENV LAUNCHER_CONF ./conf/jetty.xml ./conf/jetty-requestlog.xml
CMD ${JAVA_HOME}/bin/java \
  -Dnexus-work=${SONATYPE_WORK} -Dnexus-webapp-context-path=${CONTEXT_PATH} \
  -Dapplication-port=${APPLICATION_PORT} \
  -Xms${MIN_HEAP} -Xmx${MAX_HEAP} \
  -cp 'conf/:lib/*' \
  ${JAVA_OPTS} \
  org.sonatype.nexus.bootstrap.Launcher ${LAUNCHER_CONF}


## docker build . -t centos7:nexus

