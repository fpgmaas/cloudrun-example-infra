# cloudrun-example-infra

This is a repository that contains the code used to set up the cloud infrastructure for the 
blog post [??](??). The related GitHub repository with the Flask API can be found [here](https://github.com/fpgmaas/cloudrun-example-api).

## 1. Prerequisites

- A GCP Project with a service account that has the following roles:
    - Editor
    - Service Usage Admin
    - Artifact Registry Administrator
    - Cloud Run Admin
    - Project IAM Admin

## 2. Initializing the repository & architecture

### 2.1 Setting up the Terrafom state bucket

- Download your service account key in the `.json`-format and store it as `infra_service_account.json`.
- Run `cp .env.template .env` and add the absolute path to your service account in the `.env` file.
- Create the bucket for the Terraform backend with:
    - `source .env`
    - `terraform -chdir=backend init`
    - `terraform -chdir=backend apply`
- Find the name of the created GCP bucket in Cloud Storage on GCP, and enter it in `main/backend.tf`

### 2.2 Deploying the initial architecture

- Set the variable `first_time` in `main/variables.tf` to `true`.
- Create the initial infrastructure with:
    - `terraform -chdir=main init`
    - `terraform -chdir=main apply`

### 2.3 Prepare the repository for deploying through CI/CD

- Copy the contents of `infra_service_account.json` and paste them into a repository secret with the name `GOOGLE_CREDENTIALS`
- Set the variable `first_time` in `main/variables.tf` to `false`.

## 3. Deploying a new version of the infrastructure

- Use the service account `docker-pusher` to push a Docker image with the name `docker_image` to the artifact repository. See e.g. [here](https://github.com/fpgmaas/cloudrun-example-api).
- Set `docker_image` in `main/variables.tf` to the name of the Docker image.
- Create a Pull Request for merging the branch with your desired changes into `main`. A comment will be added with the output of `terraform plan`.
- Create a new release through the GitHub UI. This will trigger the workflow that 
calls `terraform apply`.