# Docker Instructions — horse-api-8v41k

## Overview

A FastAPI REST API service served by Uvicorn on port 8000.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-8v41k .
```

## Run

```bash
docker run -p 8000:8000 horse-api-8v41k
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

No environment variables are required for this application. Any runtime configuration should be injected via ECS task definitions or Kubernetes manifests.

## Secret Handling

For sensitive environment variables, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Port

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application via Uvicorn |

## VERSION File

The `VERSION` file is included in the image at `/app/VERSION` and contains the build timestamp.
