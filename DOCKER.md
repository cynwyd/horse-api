# Docker Instructions — horse-api-5zuqq

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn, served on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-5zuqq .
```

## Run

```bash
docker run -p 8000:8000 horse-api-5zuqq
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

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-5zuqq cat /app/VERSION
```

## Environment Variables

No required environment variables. The application runs with defaults out of the box.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0:8000` to accept connections from outside the container.
- For production secret management, use:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
