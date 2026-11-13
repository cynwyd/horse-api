# Docker Instructions — horse-api-piqp2

## Overview

A FastAPI REST API service running on Python 3 with uvicorn, containerized on Amazon Linux 2023.

- **Exposed Port:** `8000` (HTTP)
- **Health Check:** `GET /` → `200 OK`
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Run User:** `appuser` (non-root)

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-piqp2 .
```

To embed a specific build timestamp in the VERSION file:

```bash
docker build --build-arg BUILD_TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ") -t horse-api-piqp2 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-piqp2
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Check VERSION file

```bash
docker run --rm horse-api-piqp2 cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application. All runtime configuration should be injected via ECS task definitions or Kubernetes manifests.

## Secret Handling

For sensitive environment variables, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
