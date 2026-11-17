# Docker Instructions — horse-api-7yqco

## Overview

A FastAPI-based REST API service running on Python 3 with uvicorn as the ASGI server.

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-7yqco .
```

## Run

```bash
docker run -p 8000:8000 horse-api-7yqco
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## Environment Variables

No environment variables are required for this application.

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-7yqco cat /app/VERSION
```

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
