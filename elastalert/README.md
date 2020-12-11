#Create configmap for rules
kubectl create cm elastalert-rules --from-file=./elastalerts-rules/* --dry-run -o yaml

kubectl apply -f .
