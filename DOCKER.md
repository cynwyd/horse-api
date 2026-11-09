# Docker Instructions — horse-api-vbktf

## Overview

This is a FastAPI-based HTTP API service running on Python 3 with Uvicorn.  
The service name is `horse-api-vbktf`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-vbktf .
```

## Run

```bash
docker run -p 8000:8000 horse-api-vbktf
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format).

To inspect it:
```bash
docker run --rm horse-api-vbktf cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn)|

## Environment Variables

No environment variables are required to start this service. All configuration is handled via ECS task definitions or Kubernetes manifests.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
