# Docker Instructions — horse-api-o312g

## Overview

This is a FastAPI-based HTTP API service served by Uvicorn on port `8000`.

## Build

```bash
# From the root of the extracted source archive:
docker build -t horse-api-o312g .
```

## Run

```bash
docker run -p 8000:8000 horse-api-o312g
```

## Verify

Once running, the service is accessible at:

```
http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required for this application. All runtime configuration is handled via ECS task definitions or Kubernetes manifests.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI HTTP API served by Uvicorn |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC build timestamp in ISO 8601 format (e.g., `2024-06-16T23:23:53Z`).

## Secret Handling

For production deployments, manage any secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
