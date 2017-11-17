# pipeline-application

## Usage

Changes pushed to any branch except master should trigger the following actions:

  - build a container image tagged with the build ID suitable for deploying to a staging cluster
  - clone the [pipeline-infrastructure-staging](https://github.com/kelseyhightower/pipeline-infrastructure-staging) repo
  - patch the pipeline deployment configuration file with the staging container image and commit the changes to the `pipeline-infrastructure-staging` repo

> The `pipeline-infrastructure-staging` repo will deploy any updates committed to the master branch.

Tagging this repo should trigger the following actions:

  - build a container image tagged with the tag name suitable for deploying to a qa cluster
  - clone the [pipeline-infrastructure-qa](https://github.com/kelseyhightower/pipeline-infrastructure-qa) repo
  - patch the pipeline deployment configuration file with the qa container image and commit the changes to the `pipeline-infrastructure-qa` repo

> The `pipeline-infrastructure-qa` repo will deploy any updates committed to the master branch and issue a pull request to the `pipeline-infrastructure-production` repo

See the [qa/cloudbuild.yaml](qa/cloudbuild.yaml) file for more details.
