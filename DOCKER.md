# Docker Instructions — horse-api-p77jc

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Port:** `8000`
- **Health Check:** `GET /` → `{"status": "healthy", "message": "Hello from inside the container!"}`

## Build

```bash
# From the root of the extracted source archive:
docker build -t horse-api-p77jc .
```

## Run

```bash
docker run -p 8000:8000 horse-api-p77jc
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

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-p77jc cat /app/VERSION
```

## Environment Variables

No environment variables are required for this application. All configuration is self-contained.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
