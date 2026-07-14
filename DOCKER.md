# Docker Instructions — horse-api-2vyc1

## Overview

A FastAPI HTTP API service running on Python 3 with uvicorn as the ASGI server.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-2vyc1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-2vyc1
```

The API will be available at: http://localhost:8000

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to run this application.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## VERSION File

The `VERSION` file is included in the image at `/app/VERSION` and contains the build timestamp.

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
