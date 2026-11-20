# Docker Instructions — horse-api-mkzwt

## Overview

A minimal FastAPI HTTP API service running on Python 3 with uvicorn.

- **Service Name:** `horse-api-mkzwt`
- **Port:** `8000` (HTTP)
- **Health Check:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` (contains the UTC timestamp of the image build)

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-mkzwt .
```

## Run

```bash
docker run -p 8000:8000 horse-api-mkzwt
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}

# Check the VERSION file inside the container
docker run --rm horse-api-mkzwt cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application. The host and port are configured via uvicorn CLI arguments in the Dockerfile CMD.

## Secret Handling

For production deployments, manage any secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The application runs as a non-root user (`appuser`) for security.
- `index.js` was not present in this repository (Python-only project); the hostname update instruction was not applicable.
