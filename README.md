# A container with gcloud sdk and kubectl
####Ultities for doing CI/CD in a containerized environment

Inspired from Scott Smerchek's [Pushing to Google Container Registry from CircleCI](http://scottsmerchek.com/2015/07/24/pushing-to-google-container-registry-from-circleci/)

---

You need to set up your [gcloud service account](https://developers.google.com/identity/protocols/OAuth2ServiceAccount#creatinganaccount) as container dev first.

Then set up credentials as environment variable in your CI/CD configuration:

| Name          | Value       |
| ------------- |-------------|
| GCLOUD_EMAIL  | {string_of_characters}@developer.gserviceaccount.com |
| GCLOUD_KEY    | base64-encoded version of project_name-xxxxx.json|
On OSX and Linux, you can get the base64 encoded version like this:
```shell
cat project_name-xxxxx.json | base64
```

Write a script that authenticates with a gcloud service account:
auth-gcloud.sh
```shell
#! /bin/bash
echo $GCLOUD_KEY | base64 -d > gcloud.json
gcloud auth activate-service-account --key-file gcloud.json
```

And configure environment variables accordingly in your CI/CD yml file:
```shell
environment:
  CLOUDSDK_CORE_DISABLE_PROMPTS: 1
  CLOUDSDK_COMPUTE_ZONE: $GCLOUD_ZONE
  CLOUDSDK_CORE_PROJECT: $GCLOUD_PROJECTID
  GOOGLE_APPLICATION_CREDENTIALS=gcloud.json
```

Then you can manage k8s with kubectl:
```shell
script:
  - auth-gcloud.sh
  - gcloud container clusters get-credentials XXXXX
  - kubectl get pods
```
