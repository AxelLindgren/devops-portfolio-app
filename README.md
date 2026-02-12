# DevOps Portfolio

Production-style DevOps portfolio project demonstrating containerization, CI/CD, Infrastructure as Code, and Kubernetes deployment.

## What this project does
A minimal cloud-native Python application that is containerized with Docker, tested in CI, and deployed to AWS using Terraform.
The app exposes a health and version endpoint and runs on an EC2 instance provisioned through Infrastructure as Code.

---

## Architecture
- FastAPI application
- Docker container
- GitHub Actions CI pipeline
- Terraform-provisioned EC2 instance
- Remote Terraform state stored in S3
- Kubernetes deployment (Minikube)

---

## Tech stack
- Python (FastAPI)
- Docker
- GitHub Actions
- Terraform
- AWS EC2
- AWS S3 (remote state backend)
- Kubernetes (Minikube)

---

## Features
- Health endpoint: `/health`
- Version endpoint: `/version`
- Dockerized application
- CI pipeline with automated tests
- Infrastructure as Code with Terraform
- Remote state management
- Kubernetes deployment for local cluster testing

---

## Run Locally
```bash
docker build -t portfolio-app .
docker run -p 8000:8000 portfolio-app
```

Then open:
```bash
http://localhost:8000/health
```

Deploy to AWS (Terraform)
```bash
cd infra/terraform
terraform init
terraform apply
```

After apply, Terraform will output:
```bash
app_url = http://<public-ip>:8000/health
```
## Kubernetes (Local Cluster)

Start Minikube:
```bash
minikube start --driver=docker
```

Build image inside Minikube:
```bash
eval $(minikube docker-env)
docker build -t portfolio-app:latest .
```

Deploy to Kubernetes:
```bash
kubectl apply -f k8s/
kubectl get pods
```

Expose the service:
```bash
minikube service portfolio-service
```

## CI Pipeline

On every push:

- Code is tested in GitHub Actions
- Docker image is built
- Linting and tests must pass
