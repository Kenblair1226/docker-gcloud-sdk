### A container with gcloud sdk, kubectl, ...etc


To login with a gcloud service account:
```shell
gcloud auth activate-service-account $GCLOUD_EMAIL --key-file gcloud.p12
ssh-keygen -f ~/.ssh/google_compute_engine -N ""
```

Then you can execute your k8s commands with kubectl:
```shell
kubectl get pods
```
