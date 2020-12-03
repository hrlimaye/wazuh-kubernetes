FROM centos:centos7

LABEL maintainer "hrishikesh limaye"
LABEL version "3.7.2"
LABEL description "Wazuh Agent"

RUN yum install -y which
RUN echo -e "[wazuh_repo]\ngpgcheck=1\ngpgkey=https://packages.wazuh.com/key/GPG-KEY-WAZUH\nenabled=1\nname=Wazuh repository\nbaseurl=https://packages.wazuh.com/3.x/yum/\nprotect=1" > /etc/yum.repos.d/wazuh.repo

RUN yum install -y wazuh-agent-3.7.2-1

RUN yum install -y telnet net-tools procps iputils

COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["sh", "/entrypoint.sh"]