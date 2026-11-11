# Docker Instructions — horse-api-89qcf

## Overview

This is a FastAPI application served by Uvicorn on port `8000`.

## Build

```bash
# From the root of the extracted source archive:
docker build -t horse-api-89qcf .
```

## Run

```bash
docker run -p 8000:8000 horse-api-89qcf
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests.

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Port

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (Uvicorn ASGI) |

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.
