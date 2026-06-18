# Docker Instructions — horse-api-0a82p

## Overview

A FastAPI REST API service running on Python 3.9 with uvicorn, bound to `0.0.0.0:8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-0a82p .
```

## Run

```bash
docker run -p 8000:8000 horse-api-0a82p
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

A `VERSION` file is written to `/app/VERSION` at image build time containing the UTC build timestamp (e.g. `2026-06-18T21:51:00Z`). To inspect it:

```bash
docker run --rm horse-api-0a82p cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application.

## Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |

## Health Check

```
GET /
```

Expected HTTP status: `200 OK`

## Secret Handling

For production deployments, manage any secrets via:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
