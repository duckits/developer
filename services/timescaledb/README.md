# timescaledb

## References

[TimescaleDB Documentation](https://docs.timescale.com/timescaledb/latest/overview/)

## Usage

TimescaleDB can be accessed via port 5432 on the following DNS name from within your cluster:
timescaledb-single.timescaledb.svc.cluster.local

To get your password for superuser run:

    # superuser password
    PGPASSWORD_POSTGRES=$(kubectl get secret --namespace timescaledb "timescaledb-single-credentials" -o jsonpath="{.data.PATRONI_SUPERUSER_PASSWORD}" | base64 --decode)

    # admin password
    PGPASSWORD_ADMIN=$(kubectl get secret --namespace timescaledb "timescaledb-single-credentials" -o jsonpath="{.data.PATRONI_admin_PASSWORD}" | base64 --decode)

To connect to your database, choose one of these options:

1. Run a postgres pod and connect using the psql cli:
    # login as superuser
    kubectl run -i --tty --rm psql --image=postgres \
      --env "PGPASSWORD=$PGPASSWORD_POSTGRES" \
      --command -- psql -U postgres \
      -h timescaledb-single.timescaledb.svc.cluster.local postgres

    # login as admin
    kubectl run -i --tty --rm psql --image=postgres \
      --env "PGPASSWORD=$PGPASSWORD_ADMIN" \
      --command -- psql -U admin \
      -h timescaledb-single.timescaledb.svc.cluster.local postgres

2. Directly execute a psql session on the master node

   MASTERPOD="$(kubectl get pod -o name --namespace timescaledb -l release=timescaledb-single, role=master)"
   kubectl exec -i --tty --namespace timescaledb ${MASTERPOD} -- psql -U postgres
