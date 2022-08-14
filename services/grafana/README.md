# Grafana

Grafana allows you to query, visualize, alert on and understand your metrics no matter where they are stored. Create, explore, and share beautiful dashboards with your team and foster a data driven culture.

## References

[Grafana Documentation](https://grafana.com/docs/?pg=oss-graf&plcmt=quick-links)

## Usage

1. Get your 'admin' user password by running:

   kubectl get secret --namespace grafana grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

2. The Grafana server can be accessed via port 80 on the following DNS name from within your cluster:

   grafana.grafana.svc.cluster.local

   If you bind grafana to 80, please update values in values.yaml and reinstall:

```
securityContext:
   runAsUser: 0
   runAsGroup: 0
   fsGroup: 0

command:
- "setcap"
- "'cap_net_bind_service=+ep'"
- "/usr/sbin/grafana-server &&"
- "sh"
- "/run.sh"
```

   Details refer to https://grafana.com/docs/installation/configuration/#http-port.
   Or grafana would always crash.

   From outside the cluster, the server URL(s) are:

     http://grafana.lo

3. Login with the password from step 1 and the username: admin
