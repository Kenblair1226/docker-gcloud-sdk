# A container with gcloud sdk, kubectl, ...etc

You need to set up your gcloud service account credentials as environment variable first:

| Name          | Value       |
| ------------- |-------------|
| GCLOUD_EMAIL      | {string_of_characters}@developer.gserviceaccount.com |
| GCLOUD_KEY    | base64-encoded version of project_name-xxxxx.json      |

To login with a gcloud service account:
```shell
#! /bin/bash
echo $GCLOUD_KEY | base64 --decode > gcloud.p12
gcloud auth activate-service-account $GCLOUD_EMAIL --key-file gcloud.p12
ssh-keygen -f ~/.ssh/google_compute_engine -N ""
```

Then you can execute your k8s commands with kubectl:
```shell
kubectl get pods
```
