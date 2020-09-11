#!/bin/bash
############################################
#ADD Agent
#RUN this from Agent Server
############################################
#for amazon linux

#Agent name
NAME=$(hostname)-$(date +%d-%m-%Y-%H-%M-%S)

sudo rpm --import http://packages.wazuh.com/key/GPG-KEY-WAZUH
rpm --import http://packages.wazuh.com/key/GPG-KEY-WAZUH
echo '[wazuh_repo]
gpgcheck=1
gpgkey=https://packages.wazuh.com/key/GPG-KEY-WAZUH
enabled=1
name=Wazuh repository
baseurl=https://packages.wazuh.com/3.x/yum/
protect=1' | sudo tee /etc/yum.repos.d/wazuh.repo

sudo yum install wazuh-agent -y

#wazuh-manager ip running on port 1515
/var/ossec/bin/agent-auth -A $NAME -m INTERNAL_LOAD_BALANCER_1515 -P "India@123"

#add ip of wazuh worker on port 1514
sudo sed -i 's/MANAGER_IP/INTERNAL_LOAD_BALANCER_1514/g' /var/ossec/etc/ossec.conf
sudo sed -i 's/udp/tcp/g' /var/ossec/etc/ossec.conf

sudo systemctl restart wazuh-agent

############################################
#REMOVE Agent
############################################

#Get basic information about agent
#curl -u foo:bar -k -XGET 'https://INTERNAL_LOAD_BALANCER:55000/agents?select=name,status,dateAdd,lastKeepAlive&pretty'

#Purging never connected agents older than 2 days
#curl -u foo:bar -k -XDELETE 'https://INTERNAL_LOAD_BALANCER:55000/agents?status=neverconnected&older_than=2d&pretty'

#Purging disconnected agents older than 1 days
#curl -u foo:bar -k -XDELETE 'https://INTERNAL_LOAD_BALANCER:55000/agents?status=disconnected&older_than=2d&pretty'
