# Docker Instructions — horse-api-89uy9

## Overview

A FastAPI HTTP API service served by Uvicorn. The image includes a `VERSION` file generated at build time containing the build timestamp.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-89uy9 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-89uy9
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
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-89uy9 cat /app/VERSION
```
