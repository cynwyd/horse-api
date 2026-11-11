# horse-api-uht44 — Docker Instructions

## Overview

A FastAPI HTTP API service served by uvicorn. The service exposes a single `GET /` endpoint returning a health/status JSON response.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-uht44 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-uht44
```

The API will be available at: http://localhost:8000

## Health Check

```
GET http://localhost:8000/
```

Expected response: `200 OK`

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required for this application. All runtime configuration is handled via ECS task definitions or Kubernetes manifests.

## Secrets Handling

This application has no secrets. If secrets are added in the future, use:
- **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## VERSION File

A `VERSION` file is generated at image build time containing the UTC build timestamp (ISO 8601 format). It is located at `/app/VERSION` inside the container.
