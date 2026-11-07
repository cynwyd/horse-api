# Docker Instructions — horse-api-vyetd

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service exposes a single `GET /` endpoint returning a health/status response.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-vyetd .
```

## Run

```bash
docker run -p 8000:8000 horse-api-vyetd
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

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via uvicorn    |

## Environment Variables

No environment variables are required to run this application.

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-vyetd cat /app/VERSION
```

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
