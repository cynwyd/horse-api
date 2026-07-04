# Docker Instructions — horse-api-48g80

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.
The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp (UTC).

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-48g80 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-48g80
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Verify VERSION File

```bash
docker run --rm horse-api-48g80 cat /app/VERSION
```

## Environment Variables

No environment variables are required for this application.

## Port

| Port | Protocol | Description          |
|------|----------|----------------------|
| 8000 | HTTP     | FastAPI / Uvicorn    |

## Secret Handling

If secrets are needed in future, use:
- **ECS**: [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
