# Minio

MinIO offers high-performance, S3 compatible object storage.

## References

[MinIO Documentation](https://docs.min.io/minio/k8s/)

## Usage

Minio can be accessed via port 9000 on the following DNS name from within your cluster:
minio.minio.svc.cluster.local

To access Minio from localhost, run the below commands:

  1. export POD_NAME=$(kubectl get pods -n minio -l "release=minio" -o jsonpath="{.items[0].metadata.name}")

  2. kubectl port-forward $POD_NAME 9000 -n minio

Read more about port forwarding here: http://kubernetes.io/docs/user-guide/kubectl/kubectl_port-forward/

You can now access Minio server on http://localhost:9000. Follow the below steps to connect to Minio server with mc client:

  1. Download the Minio mc client - https://docs.minio.io/docs/minio-client-quickstart-guide

  2. Get credentials
      ACCESS_KEY=$(kubectl get secret minio -n minio -o jsonpath="{.data.accesskey}" | base64 --decode | xargs)
      SECRET_KEY=$(kubectl get secret minio -n minio -o jsonpath="{.data.secretkey}" | base64 --decode | xargs)

  3. mc alias set minio-local http://localhost:9000 "$ACCESS_KEY" "$SECRET_KEY" --api s3v4

  4. mc ls minio-local

Alternately, you can use your browser or the Minio SDK to access the server - https://docs.minio.io/categories/17
