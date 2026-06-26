# Docker Instructions — horse-api-0zvyp

## Overview

A FastAPI HTTP API service served by Uvicorn on port 8000.

| Property | Value |
|---|---|
| **Base Image** | `public.ecr.aws/amazonlinux/amazonlinux:2023` |
| **Language** | Python 3.9 |
| **Framework** | FastAPI 0.111.0 |
| **ASGI Server** | Uvicorn 0.30.1 |
| **Port** | 8000 |
| **Health Check** | `GET /` → HTTP 200 |
| **Run User** | `appuser` (non-root) |

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-0zvyp .
```

## Run

```bash
docker run -p 8000:8000 horse-api-0zvyp
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-0zvyp cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application.

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
