# Docker Instructions — horse-api-63x8a

## Overview

A FastAPI-based horse API service running on Python 3 with Uvicorn as the ASGI server.

- **Framework:** FastAPI 0.111.0
- **Server:** Uvicorn 0.30.1
- **Port:** 8000
- **Health check:** `GET /` → `{"status": "healthy", "message": "Hello from inside the container!"}`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-63x8a .
```

## Run

```bash
docker run -p 8000:8000 horse-api-63x8a
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

To inspect it:
```bash
docker run --rm horse-api-63x8a cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to manage any secrets.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for secret environment variables.
