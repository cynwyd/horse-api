# horse-api-9rlv5 — Docker Instructions

## Overview

A lightweight FastAPI HTTP API service served by Uvicorn on port 8000.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-9rlv5 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-9rlv5
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
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Health Check

- **Path:** `GET /`
- **Expected HTTP Status:** `200`

## Environment Variables

No environment variables are required to start this application.

## VERSION File

The Docker image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-9rlv5 cat /app/VERSION
```

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
