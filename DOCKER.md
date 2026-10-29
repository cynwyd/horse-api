# Docker Instructions — horse-api-zlmcc

## Overview

This is a FastAPI-based HTTP API service (`horse-api-zlmcc`) running on Python 3 with uvicorn.

- **Port:** 8000
- **Health check:** `GET /` → `{"status": "healthy", "message": "Hello from inside the container!"}`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-zlmcc .
```

## Run

```bash
docker run -p 8000:8000 horse-api-zlmcc
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Check VERSION file

```bash
docker run --rm horse-api-zlmcc cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. All configuration is provided at runtime via ECS task definitions or Kubernetes manifests.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0:8000` for container compatibility.
- The service name suffix `-zlmcc` has been applied as requested.
