# k8s-deployment-config

* Create a K8S cluster named `skynet-001` using below script.

```
eksctl create cluster -f simple-cluster.yaml
```

* Scale up/down Nodegroup

```
eksctl scale nodegroup --cluster=skynet-001 --nodes=3 ng
```


* Create a namespace for `flux`

```
kubectl create ns flux
```

* Install flux in the cluster with bindings to deployment

```
export GHUSER=pailabs
export GHREPO=k8s-deployment-config
fluxctl install \
--git-user=${GHUSER} \
--git-email=${GHUSER}@users.noreply.github.com \
--git-url=git@github.com:${GHUSER}/${GHREPO} \
--git-path=manifests \
--namespace=flux | kubectl apply -f -
```

* Get the Flux public key and add it to github as a deployment key with write access

```
fluxctl identity --k8s-fwd-ns flux
```

* Manually sync/trigger job

```
fluxctl sync --k8s-fwd-ns flux
```

* Few more commands to work with flux

```
fluxctl list-workloads --k8s-fwd-ns flux
fluxctl list-images --k8s-fwd-ns flux
kubectl get all -n flux
```

* Install nginx 

```
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.26.2/deploy/static/mandatory.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.26.2/deploy/static/provider/aws/service-l4.yaml
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/nginx-0.26.2/deploy/static/provider/aws/patch-configmap-l4.yaml
```