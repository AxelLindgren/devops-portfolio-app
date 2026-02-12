# DevOps Portfolio

## What this project does

A minimal cloud-native Python application that is containerized with Docker, tested in CI, and deployed to AWS using Terraform.
The app exposes a health and version endpoint and runs on an EC2 instance provisioned through Infrastructure as Code.

---

## Architecture

* FastAPI application
* Docker container
* GitHub Actions CI pipeline
* Terraform-provisioned EC2 instance
* Remote Terraform state stored in S3

---

## Tech stack

* Python (FastAPI)
* Docker
* GitHub Actions
* Terraform
* AWS EC2
* AWS S3 (remote state backend)

---

## How to run locally

Build and run the container:

```bash
docker build -t portfolio-app .
docker run -p 8000:8000 portfolio-app
```

Test the health endpoint:

```bash
curl http://localhost:8000/health
```

---

## CI pipeline

On every push:

* Runs tests
* Builds Docker image
* Verifies application health

Defined in:

```
.github/workflows/
```

---

## How to deploy

1. Navigate to Terraform directory:

```bash
cd infra/terraform
```

2. Initialize Terraform:

```bash
terraform init
```

3. Apply infrastructure:

```bash
terraform apply
```

4. After deployment, get the public URL:

```bash
terraform output
```

5. Test the running app:

```bash
curl http://<public-ip>:8000/health
```

---

## Terraform

Terraform provisions:

* EC2 instance for the application
* Security group allowing:

  * SSH (port 22)
  * App traffic (port 8000)
* Remote state stored in S3

Destroy infrastructure when done:

```bash
terraform destroy
```
