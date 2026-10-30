# Docker Instructions — horse-api-vkm3x

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.
The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-vkm3x .
```

## Run

```bash
docker run -p 8000:8000 horse-api-vkm3x
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

## Verify VERSION file

```bash
docker run --rm horse-api-vkm3x cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Environment Variables

No environment variables are required to start this application. Any future configuration
should be injected via ECS task definitions or Kubernetes pod specs — do **not** hardcode
values in the Dockerfile.

## Secret Handling

For sensitive configuration values, use:
- **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
