# Docker Build & Run Instructions — horse-api-1rd47

## Overview

This is a FastAPI application served by Uvicorn on port **8000**, containerized on Amazon Linux 2023.

A `VERSION` file containing the UTC build timestamp is embedded in the image at `/app/VERSION`.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-1rd47 .
```

---

## Run

```bash
docker run --rm -p 8000:8000 horse-api-1rd47
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start this application. All runtime configuration (if added in future) should be injected via ECS task definitions or Kubernetes pod specs — do **not** hardcode values in the Dockerfile.

---

## Secrets Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Inspect VERSION file

```bash
docker run --rm horse-api-1rd47 cat /app/VERSION
```

---

## Stopping the Container

```bash
docker stop <container_id>
```
