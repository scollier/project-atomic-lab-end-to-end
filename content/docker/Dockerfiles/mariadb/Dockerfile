FROM fedora:20
MAINTAINER Stephen Tweedie <sct@redhat.com>

RUN yum -y update; yum clean all
RUN yum -y install mariadb-server pwgen supervisor psmisc net-tools; yum clean all

VOLUME [ "/var/lib/mysql" ]

ADD ./start.sh /start.sh
ADD ./supervisord.conf /etc/supervisord.conf

RUN chmod 755 /start.sh

EXPOSE 3306

CMD ["/bin/bash", "/start.sh"]

