# Docker Build & Run Instructions — horse-api-pjoo5

## Overview

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Port:** 8000 (HTTP)
- **Service Name:** horse-api-pjoo5

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-pjoo5 .
```

To include a specific build timestamp in the `VERSION` file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-pjoo5 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-pjoo5
```

## Verify

Once running, verify the application is healthy:

```bash
curl http://localhost:8000/
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Check VERSION file

```bash
docker run --rm horse-api-pjoo5 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. All configuration is self-contained.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the build timestamp (UTC ISO 8601 format).
- For production secret management, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
