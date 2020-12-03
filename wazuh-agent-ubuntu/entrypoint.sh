#!/bin/bash

# Register agent if client.keys is empty
if [ ! -s /var/ossec/etc/client.keys ]; then
  groups=${JOIN_GROUPS:-default}
  password="${JOIN_PASSWORD}"
  if [ ! -z ${JOIN_PASSWORD} ]; then
    password="-P ${JOIN_PASSWORD}"
  fi
  manager="${JOIN_MANAGER}"
  worker="${JOIN_WORKER}"
  name="${HOSTNAME}"
  /var/ossec/bin/agent-auth -A $name -m $manager -G $groups $password
fi
# password="-P ${JOIN_PASSWORD}"
# manager="${JOIN_MANAGER}"
# worker="${JOIN_WORKER}"
# name="${HOSTNAME}"

sed -i "s/MANAGER_IP/$worker/g" /var/ossec/etc/ossec.conf
sed -i "s/udp/tcp/g" /var/ossec/etc/ossec.conf

# Start the agent
service wazuh-agent start
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start agent: $status"
  exit $status
fi

echo "background jobs running, listening for changes"

while true 
do
  #/var/ossec/bin/ossec-control status > /dev/null 2>&1
  service wazuh-agent status
  status=$?
  if [ $status -ne 0 ]; then
    echo "looks like the agent died...Exiting the container."
    exit 1
  fi
  sleep 120
done