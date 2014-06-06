FROM fedora:20
MAINTAINER Scott Collier <scollier@redhat.com>

RUN yum -y install mariadb-server pwgen supervisor psmisc net-tools; yum clean all

RUN mkdir -p /var/log/mysql && \
    touch /var/log/mysql/.keep /var/lib/mysql/.keep && \
    chown -R mysql:mysql /var/log/mysql /var/lib/mysql

ADD ./simple.cnf /etc/my.cnf.d/
ADD ./config_mariadb.sh /config_mariadb.sh

EXPOSE 3306

CMD [ "/config_mariadb.sh" ]
