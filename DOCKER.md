# Docker Instructions — horse-api-b6zlu

## Overview

A FastAPI-based REST API served by uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-b6zlu .
```

## Run

```bash
docker run -p 8000:8000 horse-api-b6zlu
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI REST API served by uvicorn |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## VERSION File

The `VERSION` file contains the build timestamp and is included in the image at `/app/VERSION`.
