# Docker Instructions — horse-api-28tyx

## Overview

A FastAPI HTTP API service served by uvicorn on port 8000.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-28tyx .
```

## Run

```bash
docker run -p 8000:8000 horse-api-28tyx
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

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## Environment Variables

No environment variables are required to run this application.

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-28tyx cat /app/VERSION
```

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
