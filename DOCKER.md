# Docker Build & Run Instructions — horse-api

## Overview

A minimal FastAPI application served by Uvicorn on port **8000**.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

Run the following command from the **root of the extracted source directory**:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-dv5n7 .
```

To embed a specific build timestamp in the `VERSION` file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-dv5n7 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-dv5n7
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

No environment variables are required for this application. All runtime configuration is handled via ECS task definitions or Kubernetes manifests.

---

## Security Notes

- The container runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
