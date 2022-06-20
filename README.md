# cloudrun-example-infra

This is a repository that contains the code used to set up the cloud infrastructure for the 
blog post [??](??). The related GitHub repository with the Flask API can be found [here](https://github.com/fpgmaas/cloudrun-example-api).

### Prerequisites

- A GCP Project with a service account that has the following roles:
    - Editor
    - Service Usage Admin
    - Artifact Registry Administrator
    - Cloud Run Admin
    - Project IAM Admin

### Deploying the infrastructure for the first time

- Download the service account key in the `.json`-format
- Copy the contents of your service account key, and paste them into a repository secret with the name `GOOGLE_CREDENTIALS`
- Create a new Release through the GitHub UI.
- Now, the release workflow will deploy all required infrastructure except for the Cloud Run container. When the workflow tries to deploy the container it returns an Error, since the Docker image to be deployed through Cloud Run does not exist yet.
- To continue the initial set up, download the service account key from the newly created `docker-pusher` service account and use that to push your Docker image with the name `docker_image` to the repository `repository`, in line with your configuration in `variables.tf`. 
- To finalize the set up and start the Cloud Run container, simply run the workflow again manually or by creating a new release.

### Deploying a new version of the infrastructure

- Create a Pull Request for merging the branch with your desired changes into `main`. A comment will be added with the output of `terraform plan`.
- Create a new release through the GitHub UI. This will trigger the workflow that 
calls `terraform apply`.