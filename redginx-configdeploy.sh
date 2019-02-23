kubectl create configmap redginx-nginx-lua-config --from-file nginx.conf -n ingress-redginx
kubectl create configmap redginx-redis-slave-config --from-file redis.conf -n ingress-redginx