FROM bde2020/hadoop-submit:1.2.1-hadoop2.8-java8
MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>


ENV JAR_FILEPATH="/opt/hadoop/applications/application.jar"
ENV JAR_NAME="application"

ADD template.sh /template.sh
RUN chmod a+x /template.sh

RUN apt-get update \
      && apt-get install -y maven \
      && update-java-alternatives -s java-1.8.0-openjdk-amd64 \
      && mkdir -p /applications \
      && mkdir -p /opt/hadoop/applications

# Copy the POM-file first, for separate dependency resolving and downloading
#ONBUILD COPY pom.xml /opt/hadoop/applications
#ONBUILD RUN cd /opt/hadoop/applications \
#      && mvn dependency:resolve
#ONBUILD RUN cd /opt/hadoop/applications \
#      && mvn verify

# Copy the source code and build the application
ONBUILD COPY . /opt/hadoop/applications
ONBUILD RUN cd /opt/hadoop/applications \
      && mvn clean package


CMD ["/template.sh"]
