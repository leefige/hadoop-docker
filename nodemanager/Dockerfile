# Original maintainer:
# MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>

FROM leefige/hadoop-base:ubuntu20.04

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]
