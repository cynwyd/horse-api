# Docker Instructions — horse-api-moru2

## Overview

A Python FastAPI service containerized on Amazon Linux 2023, served by `uvicorn` on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-moru2 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-moru2
```

The API will be available at: `http://localhost:8000`

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required for this application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file inside the container contains the build timestamp.
- For secret handling in production, use:
  - **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
