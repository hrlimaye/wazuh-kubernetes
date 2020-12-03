docker run -d --name wazuh-agent \
  -e HOSTNAME=${HOSTNAME} \
  -e JOIN_MANAGER=MANAGER_DNS_1515 \
  -e JOIN_GROUPS=default \
  -e JOIN_PASSWORD=India@123 \
  -e JOIN_WORKER=WORKER_DNS_1514 \
  -v /var/log:/var/log \
  wazuh-agent:centos-1.1