# Docker Instructions — horse-api-iu8lg

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. Exposes port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-iu8lg .
```

## Run

```bash
docker run -p 8000:8000 horse-api-iu8lg
```

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
docker run --rm horse-api-iu8lg cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Notes

- The application listens on `0.0.0.0:8000` inside the container.
- The container runs as a non-root `appuser` for security.
- For secret management in production, use:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
