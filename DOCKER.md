# Docker Instructions — horse-api-u0raf

## Overview

A FastAPI HTTP API service served by uvicorn. The image includes a `VERSION` file stamped with the build timestamp.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-u0raf .
```

## Run

```bash
docker run -p 8000:8000 horse-api-u0raf
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

The image contains a `/app/VERSION` file with the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-u0raf cat /app/VERSION
```

## Environment Variables

No environment variables are required for this application.

## Exposed Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
