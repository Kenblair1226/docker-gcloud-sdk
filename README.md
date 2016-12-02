# A container with gcloud sdk, kubectl, ...etc

You need to set up your gcloud service account credentials as environment variable first:

| Name          | Value       |
| ------------- |-------------|
| GCLOUD_EMAIL      | {string_of_characters}@developer.gserviceaccount.com |
| GCLOUD_KEY    | base64-encoded version of project_name-xxxxx.json      |

To login with a gcloud service account:
```shell
#! /bin/bash
echo $GCLOUD_KEY | base64 -d > gcloud.json
gcloud auth activate-service-account --key-file gcloud.json
```

And configure environment variables accordingly:
```shell
CLOUDSDK_CORE_DISABLE_PROMPTS: 1
CLOUDSDK_PYTHON_SITEPACKAGES: 1
CLOUDSDK_COMPUTE_ZONE: $GCLOUD_ZONE
CLOUDSDK_CORE_PROJECT: $GCLOUD_PROJECTID
GOOGLE_APPLICATION_CREDENTIALS=gcloud.json
```

Then you can execute your k8s commands with kubectl:
```shell
gcloud container clusters get-credentials XXXXX
kubectl get pods
```
