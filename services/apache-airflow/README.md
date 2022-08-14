# Apache Airflow

Airflow is a platform created by the community to programmatically author, schedule and monitor workflows.

## references

[Airflow Documentation](https://airflow.apache.org/docs/)

## issues

airflow pods failed to start 
waiting for migrations 

## notes

using --atomic on helm install prevents the migration job pod from launching
I suspect this is due to the job being triggered by a post-install hook and the post install hook being blocked by --atomic waiting for the install to complete

## Usage

Thank you for installing Apache Airflow 2.3.0!

Your release is named airflow.
You can now access your service(s) by following defined Ingress urls:

Airflow Webserver:

      https://airflow.lo

Default Webserver (Airflow UI) Login credentials:

    username: admin
    password: p@s5w0rd

You can get Fernet Key value by running the following:

    echo Fernet Key: $(kubectl get secret --namespace airflow airflow-fernet-key -o jsonpath="{.data.fernet-key}" | base64 --decode | xargs)

##  WARNING: You should set a static webserver secret key  #

You are using a dynamically generated webserver secret key, which can lead to
unnecessary restarts of your Airflow components.

Information on how to set a static webserver secret key can be found here:
https://airflow.apache.org/docs/helm-chart/stable/production-guide.html#webserver-secret-key
