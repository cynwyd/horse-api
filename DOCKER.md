# Docker Build and Run Instructions

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service Name:** `horse-api-k5xc1`
- **Port:** `8000` (HTTP)
- **Health Check:** `GET /` → HTTP 200

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-k5xc1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-k5xc1
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION`, containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-k5xc1 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use the following for secret management:
- **ECS:** [Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
