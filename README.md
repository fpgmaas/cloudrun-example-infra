# cloudrun-example-infra

This is a repository that contains the code used to set up the infra for the 
blog post [Deploying a Flask API to Google Cloud Run using Terraform](https://fpgmaas.com/blog/deploying-a-flask-api-to-cloudrun).

### Prerequisites

- A GCP Project with a service account that has the following roles:
    - Editor
    - Service Usage Admin
    - Artifact Registry Administrator
    - Cloud Run Admin
    - Project IAM Admin

### How to deploy the infrastrcture?
- Download the service account key in the `.json`-format
- Copy the contents of your service account key, and paste them into a repository secret with the name `GOOGLE_CREDENTIALS`
- Create a new Release through the GitHub UI.

### Note: Deploying the infrastructure for the first time

When releasing for the first time, the release workflow will deploy all required infrastructure except for the Cloud Run container. When the workflow tries to deploy the container it returns an Error, since the Docker image to be deployed through Cloud Run does not exist yet. To continue the initial set up, download the service account key from the newly created `docker-pusher` service account and use that to push your Docker image with the name `docker_image` to the repository `repository`, in line with your configuration in `variables.tf`. To finalize the set up and start the Cloud Run container, simply run the workflow again manually or by creating a new release.