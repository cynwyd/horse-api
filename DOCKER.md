# Docker Instructions — horse-api-2dol7

## Overview

A FastAPI Python web service exposing a REST API with a health/status endpoint.
The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp (UTC).

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-2dol7 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-2dol7
```

The API will be available at: http://localhost:8000

## Health Check

```
GET /
```

Expected response: `200 OK`

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application. Any runtime configuration should be injected via ECS task definitions or Kubernetes manifests.

## Secrets Handling

For sensitive environment variables, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## VERSION File

The image contains a `/app/VERSION` file with the UTC build timestamp in ISO 8601 format:

```bash
docker run --rm horse-api-2dol7 cat /app/VERSION
```
