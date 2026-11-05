# Docker Instructions — horse-api-a0z3w

## Overview

A FastAPI-based Python REST API service running on uvicorn, bound to `0.0.0.0:8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-a0z3w .
```

To embed a specific build timestamp in the VERSION file:

```bash
docker build --build-arg BUILD_TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ") -t horse-api-a0z3w .
```

## Run

```bash
docker run -p 8000:8000 horse-api-a0z3w
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
docker run --rm horse-api-a0z3w cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application. All runtime configuration should be injected via ECS task definitions or Kubernetes manifests.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
