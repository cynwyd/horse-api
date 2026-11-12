# Docker Instructions — horse-api-7iebm

## Overview

A FastAPI-based REST API service running on Python 3 with uvicorn as the ASGI server.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-7iebm .
```

## Run

```bash
docker run -p 8000:8000 horse-api-7iebm
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

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-7iebm cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI/uvicorn HTTP API |

## Secret Handling

For production deployments, manage any secrets via:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
