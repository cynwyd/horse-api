# Docker Instructions — horse-api-mojii

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service name is `horse-api-mojii`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-mojii .
```

## Run

```bash
docker run -p 8000:8000 horse-api-mojii
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the image build time.

To inspect it:
```bash
docker run --rm horse-api-mojii cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |

## Environment Variables

No environment variables are required to start this application. Any future configuration should be injected via ECS task definitions or Kubernetes pod specs — do **not** hardcode secrets in the Dockerfile.

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
