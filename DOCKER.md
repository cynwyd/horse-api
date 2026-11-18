# Docker Instructions — horse-api-ofb44

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service exposes a single `GET /` endpoint returning a health/status response.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ofb44 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-ofb44
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

The Docker image includes a `/app/VERSION` file containing the timestamp of when the image was built. To inspect it:

```bash
docker run --rm horse-api-ofb44 cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via uvicorn    |

## Environment Variables

No environment variables are required to start the application. Additional configuration can be injected at runtime via ECS task definitions or Kubernetes manifests.

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
