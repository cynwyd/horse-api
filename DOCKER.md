# Docker Instructions — horse-api-1713y

## Overview

A FastAPI-based HTTP API service served by Uvicorn. The image includes a `VERSION` file stamped with the build timestamp.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-1713y .
```

## Run

```bash
docker run -p 8000:8000 horse-api-1713y
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## VERSION File

The image contains `/app/VERSION` with the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-1713y cat /app/VERSION
```

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
