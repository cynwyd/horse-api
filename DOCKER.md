# Docker Build and Run Instructions — horse-api-m8m3j

## Overview

This is a Python FastAPI application containerized on Amazon Linux 2023.

- **Service name:** `horse-api-m8m3j`
- **Language:** Python 3.9
- **Framework:** FastAPI + Uvicorn
- **Port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → HTTP 200

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-m8m3j .
```

## Run

```bash
docker run -p 8000:8000 horse-api-m8m3j
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is written to `/app/VERSION` at image build time containing the UTC timestamp of the build. To inspect it:

```bash
docker run --rm horse-api-m8m3j cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any sensitive configuration.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for secret management.
