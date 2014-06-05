# FROM scollier/apache
FROM fedora:20
MAINTAINER Stephen Tweedie <sct@redhat.com>

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

# Now wiki data.  We'll expose the wiki at $host/wiki, so the html root will be
# at /var/www/html/wiki; to allow this to be used as a data volume we keep the
# initialisation in a separate script.

ADD ./config.sh /config.sh
ADD ./LocalSettings.php /var/www/html/wiki/
RUN chmod +x /config.sh
RUN /config.sh

ADD run-mw.sh /run-mw.sh
RUN chmod +x /run-mw.sh

EXPOSE 80

CMD [ "/run-mw.sh" ]
