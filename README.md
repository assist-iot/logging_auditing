# DLT Logging and Auditing


## Assumptions

- DLT Helm charts have to be deployed on the SAME NODE of the cluster
- Logging & auditing chaincode will be deployed with the current helm cart.
- This is a quick README, a more fomal will be created.
- For more information contact: tzionasev@iti.gr

## Installation instructions
#### Important note
You will have to use the nodeSelector, so in values.yaml file:
```
# Deploy all the components in the same node
enablerNodeSelector: 
  kubernetes.io/hostname: vm2 
```
Replace vm2 with your node name.
#### For quick installation use the name logging (recommended)
```
cd logging_auditing
helm install logging .
```
To uninstall:
```
helm uninstall logging
```
#### In case you want to use another name:
```
cd hlf-helm
./scripts/packageCC.sh
```
This will ask you for a $releaseName. Use the same $releaseName on you helm install command. Each time you want to use another name, you will have to run the packageCC.sh script and do it while in the logging_auditing folder.
```
helm install $releaseName .
```
To uninstall:
```
helm uninstall $releaseName
```
## Usage
You communicate with http requests at the port 31999.

## Test and Deploy
### Check the installation
You need to follow the logs of clipeer0org1. Get the pods and copy the name of the pod.
```
kubectl get po
kubectl logs -f $clipeer0org1_pod_name
```
When it is over you should be able to see in all chaincodes status 200
```
INFO [chaincodeCmd] chaincodeInvokeOrQuery -> Chaincode invoke successful. result: status:200 
```
### In case you want to clean the pvc
Important note, you need to deploy the pod inside the same node, so in dltinspectionpod.yaml you need to add the node name:
```
  nodeSelector:
    kubernetes.io/hostname: name_of_the_node
```
Inside the hlf-helm fodler:
```
kubectl apply -f dltinspectionpod.yaml
kubectl exec -it inspect /bin/sh
```
Inside the container:
```
rm -r data
exit
```
It returns resource is busy, but it gets cleaned.
Back to the hlf-helm fodler:
```
kubectl delete pod inspect
```
## Notes
- It might need some restarts
- It needs some time for the components to be deployed ~5-6 minutes after the images get cached.
