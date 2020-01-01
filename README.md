# k8s-deployment-config
K8S App Deployment Config


## Continuous Delivery

* Setup Flux CD to deliver the deployment configs to K8S Cluster.

```
./flux-install.sh pailabs k8s-deployment-config manifests
```

* Run this command to get the Flux public key and add it to github as a deployment key with write access
```
fluxctl identity --k8s-fwd-ns flux
```

* To get Flux and GitHub in sync for this first go-round, issue a manual Flux sync command. Flux immediately ensures that the state of objects in Kubernetes for which we have a YAML file match.

```
fluxctl sync --k8s-fwd-ns flux
```



fluxctl list-workloads --k8s-fwd-ns flux

fluxctl list-images --k8s-fwd-ns flux