FROM ubuntu:latest

LABEL maintainer "hrishikesh limaye"
LABEL version "3.7.2"
LABEL description "Wazuh Agent"

RUN apt-get update && \
  apt-get install -y gnupg2 gnupg gnupg1 curl && \
  apt-get install -y apt-transport-https lsb-release && \
  curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add - && \
  echo "deb https://packages.wazuh.com/3.x/apt/ stable main" | tee /etc/apt/sources.list.d/wazuh.list && \
  apt-get update && \
  apt-get install -y wazuh-agent=3.7.2-1 && \
  rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y telnet net-tools procps iputils-ping

COPY entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["sh", "/entrypoint.sh"]