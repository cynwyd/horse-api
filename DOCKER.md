# Docker Instructions — horse-api-k0q7e

## Overview

A FastAPI HTTP API service served by Uvicorn, bound to `0.0.0.0:8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-k0q7e .
```

## Run

```bash
docker run -p 8000:8000 horse-api-k0q7e
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-k0q7e cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## Health Check

`GET /` returns `200 OK` with `{"status": "healthy", "message": "Hello from inside the container!"}`.

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required.
- For production deployments on ECS or EKS, manage any future secrets via:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
