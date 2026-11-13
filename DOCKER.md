# Docker Instructions — horse-api-ml97h

## Overview

This is a FastAPI-based HTTP API service containerized on Amazon Linux 2023 with Python 3.
The container embeds a `VERSION` file (generated at build time) containing the UTC build timestamp.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ml97h .
```

## Run

```bash
docker run -p 8000:8000 horse-api-ml97h
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
docker run --rm horse-api-ml97h cat /app/VERSION
```

## Environment Variables

No environment variables are required for this application to start.

## Exposed Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
