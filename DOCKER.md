# Docker Instructions — horse-api-hd4qp

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port `8000`.

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-hd4qp .
```

To include a VERSION file with a build timestamp:

```bash
docker build --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" -t horse-api-hd4qp .
```

## Run

```bash
docker run -p 8000:8000 horse-api-hd4qp
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via Uvicorn    |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## Environment Variables

No environment variables are required for this application. All runtime configuration can be injected via ECS task definitions or Kubernetes pod specs.

## Secret Handling

For any future secrets (API keys, database credentials, etc.), use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
