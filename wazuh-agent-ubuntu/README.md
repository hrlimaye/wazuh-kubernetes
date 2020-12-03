this script install wazuh agent on amazon linux.
Please watch out for below 2 variables:
  1 - INTERNAL_LOAD_BALANCER_1515
  2 - INTERNAL_LOAD_BALANCER_1514

Value of these load balancer you will get by running below command
 - kubectl get svc -n wazuh  (here we assume you have deploy this stack on wazuh namespace)
 - Update these value before you run this script.

password to authenticate to wazuh manager is India@123. In case you want to change, you can easily to that by updating configuration yaml file of wazuh-manager-sts.yaml, wazuh-worker-0-sts.yaml and wazuh-worker-1-sts.yaml where you see post hook option.
