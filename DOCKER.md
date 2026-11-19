# Docker Instructions — horse-api-kehd1

## Overview

A FastAPI-based Python REST API service running on Uvicorn, exposed on port **8000**.

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-kehd1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-kehd1
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
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI server) |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## Environment Variables

No environment variables are required for this application.

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format), generated at image build time.

```bash
docker run --rm horse-api-kehd1 cat /app/VERSION
```

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required.
- For production deployments, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
