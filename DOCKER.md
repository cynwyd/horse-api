# Docker Build & Run Instructions — horse-api-dcszz

## Overview

A FastAPI application served by Uvicorn on port `8000`.  
A `VERSION` file containing the build timestamp (UTC) is embedded in the image at `/app/VERSION`.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws/amazonlinux/amazonlinux:2023` (public, no authentication required)

---

## Build

Run the following command from the **root of the extracted source directory**:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-dcszz .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-dcszz
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

## Verify VERSION File

```bash
docker run --rm horse-api-dcszz cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application. All runtime configuration (if needed) should be injected via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
