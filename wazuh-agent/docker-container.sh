docker run -d --name wazuh-agent \
  -e HOSTNAME=${HOSTNAME} \
  -e JOIN_MANAGER=MANAGER_DNS_1515 \
  -e JOIN_GROUPS=default \
  -e JOIN_PASSWORD=India@123 \
  -e JOIN_WORKER=WORKER_DNS_1514 \
  -v /var/log/messages:/var/log/messages \
  -v /var/log/secure:/var/log/secure \
  hrlimaye/wazuh-agent:2.0
