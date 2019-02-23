# redginx 0.1.0 by Ali Alper AK
Redis + Nginx + Lua Reverse Proxy as a Dynamic Kubernetes Ingress

redginx works with a redis-master with persistent storage and scalable number of redginx ingress deployments. With every redginx deployment you will be running redis slave + nginx lua connected via Unix Socket. Its light weight, scalable and works fast.

For records in redis-master you should define every domain name with complete Kubernetes internal dns name.

Example:
KEY: test.kubernetescluster.com
VALUE: servicename.namespace.svc.cluster.local

It deploys under ingress-redginx namespace.
Currently it works but it's still under development. It's open for your contributions.

Installation Instructions:

kubectl apply -f ./redginx-ns.yaml
kubectl create configmap redginx-nginx-lua-config --from-file nginx.conf -n ingress-redginx
kubectl create configmap redginx-redis-slave-config --from-file redis.conf -n ingress-redginx
kubectl apply -f ./redis-pvc.yaml
kubectl apply -f ./redis-master.yaml
kubectl apply -f ./redis-service.yaml
kubectl apply -f ./redginx-deployment.yaml
kubectl apply -f ./redginx-service.yaml

Note: PVCs are configured for GKE, you should configure for your own kubernetes environment.

To Do:
-Update Deployment Scripts to latest api versions
-Update redis & nginx configs to make production ready
