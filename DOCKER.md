# Docker Instructions — horse-api

## Overview

A FastAPI-based HTTP API served by Uvicorn. The image includes a `VERSION` file at `/app/VERSION` containing the UTC timestamp of when the image was built.

## Build

From the root of the source directory:

```bash
docker build -t horse-api .
```

## Run

```bash
docker run -p 8000:8000 horse-api
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

## VERSION File

The image contains a build timestamp at `/app/VERSION`. To inspect it:

```bash
docker run --rm horse-api cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

If secrets are needed in the future, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
