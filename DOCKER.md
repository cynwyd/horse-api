# Docker Instructions — horse-api-tu0y1

## Overview

This is a FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server. The container exposes port `8000` and includes a `VERSION` file stamped with the build timestamp.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-tu0y1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-tu0y1
```

## Verify

Once running, the API is accessible at:

```
http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application. All runtime configuration can be injected via ECS task definitions or Kubernetes pod specs.

## Secret Handling

For production deployments, use the following to manage secrets:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (via Secrets Manager or KMS encryption)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application port |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-tu0y1 cat /app/VERSION
```
