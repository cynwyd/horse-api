# Docker Instructions — horse-api-27uri

## Overview

A FastAPI-based REST API served by Uvicorn on port **8000**.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-27uri .
```

## Run

```bash
docker run -p 8000:8000 horse-api-27uri
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the build.

```bash
docker run --rm horse-api-27uri cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via Uvicorn    |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

## Secret Handling

No secrets are required for this application. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
