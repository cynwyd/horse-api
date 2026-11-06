# Docker Instructions — horse-api-oktds

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-oktds .
```

## Run

```bash
docker run -p 8000:8000 horse-api-oktds
```

The API will be available at: http://localhost:8000

## Health Check

```
GET /
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Environment Variables

No environment variables are required for this application.

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
