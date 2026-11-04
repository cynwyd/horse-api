# Docker Instructions — horse-api-ccait

## Overview

A Python FastAPI REST API served by uvicorn. The service name is `horse-api-ccait`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ccait .
```

## Run

```bash
docker run -p 8000:8000 horse-api-ccait
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
| 8000 | HTTP     | FastAPI application served by uvicorn |

## Environment Variables

No environment variables are required for this application.

## VERSION File

The `VERSION` file is included in the image at `/app/VERSION` and contains the build timestamp.

## Secret Handling

This application has no secrets. If secrets are added in the future, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
