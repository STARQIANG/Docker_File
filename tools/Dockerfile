#  安装了常用软件 openssh-server、supervisor、vim、tar、wget、curl、rsync、bzip2、iptables、tcpdump、less、telnet、net-tools、lsof、sysstat、cron
#  安装ssh
FROM centos:centos7

#   更换为网易yum源
RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup
ADD ./CentOS7-Base-163.repo  /etc/yum.repos.d/CentOS-Base.repo

RUN yum clean all
RUN yum install -y yum-plugin-ovl || true
RUN yum install -y  openssh-server vim tar wget curl rsync bzip2 iptables tcpdump less telnet net-tools lsof sysstat cronie python-setuptools git
RUN yum clean all
RUN easy_install supervisor

#   更改时区
RUN /bin/cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
  && echo 'Asia/Shanghai' >/etc/timezone

# 中文乱码
RUN echo "export LC_ALL=zh_CN.UTF-8"  >>  /etc/profile
ENV LANG="zh_CN.UTF-8"

# 初始化ssh登陆 并且暴露22端口并且设置root用户名密码
RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' \
    &&  ssh-keygen -t dsa -f /etc/ssh/ssh_host_dsa_key -N ''   \
    &&  ssh-keygen -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N ''  \
    &&  ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N '' \
    &&  echo "RSAAuthentication yes" >> /etc/ssh/sshd_config \
    &&  echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config \
    &&  mkdir /var/run/sshd && echo "root:123456" | chpasswd
EXPOSE 22

RUN  mkdir -p /etc/supervisor/conf.d/  && \
     /usr/bin/echo_supervisord_conf > /etc/supervisord.conf && \
     echo [include] >> /etc/supervisord.conf && \
     echo 'files = /etc/supervisor/conf.d/*.conf' >> /etc/supervisord.conf

COPY sshd.conf /etc/supervisor/conf.d/sshd.conf
CMD ["/usr/bin/supervisord"]


## docker build . -t centos7:tools

