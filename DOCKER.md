# horse-api-gozso — Docker Build & Run Guide

## Overview

- **Service name:** `horse-api-gozso`
- **Language:** Python 3
- **Framework:** FastAPI + uvicorn
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-gozso .
```

## Run

```bash
docker run -p 8000:8000 horse-api-gozso
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is baked into the image at `/app/VERSION` containing the UTC timestamp of the image build:

```bash
docker run --rm horse-api-gozso cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this service.

## Secret Handling

If secrets are needed in future, use:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager / KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The container runs as a non-root user (`appuser`) for security.
- `index.js` was not found in this repository — the hostname update instruction was not applicable.
