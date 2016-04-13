FROM centos:7
MAINTAINER QAware OSS <qaware-oss@qaware.de>

ENV JAVA_VERSION 8u77
ENV BUILD_VERSION b03

RUN yum -y upgrade
RUN yum -y install wget

RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$BUILD_VERSION/server-jre-$JAVA_VERSION-linux-x64.tar.gz" -O /tmp/server-jre-8-linux-x64.tar.gz

RUN tar xzf /tmp/server-jre-8-linux-x64.tar.gz
RUN mv /tmp/jdk1.8.0_77 /usr/java/

RUN alternatives --install /usr/bin/java java /usr/java/jdk1.8.0_77/bin/java 1
RUN alternatives --install /usr/bin/javac javac /usr/java/jdk1.8.0_77/bin/javac 1

ENV JAVA_HOME /usr/java/jdk1.8.0_77

RUN rm -f /tmp/server-jre-8-linux-x64.tar.gz
RUN yum remove wget; yum clean all
