# JupyterHub

A multi-user version of the notebook designed for companies, classrooms and research labs

## References

[JupyterHub Documentation](https://docs.jupyter.org/en/latest/)

## Usage

Thank you for installing JupyterHub!

Your release is named "jupyterhub" and installed into the namespace "jupyterhub".

You can check whether the hub and proxy are ready by running:

 kubectl --namespace=jupyterhub get pod

and watching for both those pods to be in status 'Running'.

You can find the NodePorts of JupyterHub by running:

  kubectl --namespace=jupyterhub get svc proxy-public -o jsonpath='{range .spec.ports[*]} {.name}: {.port}{"\n"} {end}'

You should be able to access JupyterHub using your configured ingress at:

  http://jupyterhub.lo/
  https://jupyterhub.local/

To get full information about the JupyterHub proxy service run:

  kubectl --namespace=jupyterhub get svc proxy-public
