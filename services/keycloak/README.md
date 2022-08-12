# KeyCloak

Open Source Identity and Access Management

## References

[Keycloak Documentation](https://www.keycloak.org/documentation)

```txt
https://www.keycloak.org/getting-started/getting-started-kube
```

## Usage

Keycloak can be accessed through the following DNS name from within your cluster:

    keycloak.keycloak.svc.cluster.local (port 80)

To access Keycloak from outside the cluster execute the following commands:

1. Get the Keycloak URL and associate its hostname to your cluster external IP:

   export CLUSTER_IP=$(minikube ip) # On Minikube. Use: `kubectl cluster-info` on others K8s clusters
   echo "Keycloak URL: https://keycloak.lo/"
   echo "$CLUSTER_IP  keycloak.lo" | sudo tee -a /etc/hosts

2. Access Keycloak using the obtained URL.
3. Access the Administration Console using the following credentials:

  echo Username: root
  echo Password: $(kubectl get secret --namespace keycloak keycloak -o jsonpath="{.data.admin-password}" | base64 -d | xargs)
