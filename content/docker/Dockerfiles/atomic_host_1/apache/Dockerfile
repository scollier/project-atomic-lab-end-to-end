FROM fedora:20
MAINTAINER Scott Collier <scollier@redhat.com>

ENV container docker

VOLUME [ "/sys/fs/cgroup" ]

RUN yum -y update; yum clean all
RUN yum -y install systemd mediawiki php php-mysqlnd httpd; yum clean all; \
(cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*; \
systemctl enable httpd.service
# yum -y erase iprutils

EXPOSE 80

CMD [ "/usr/sbin/init" ]
