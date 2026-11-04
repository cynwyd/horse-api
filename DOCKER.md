# Docker Instructions — horse-api-1ocnj

## Overview

This is a Python FastAPI application served by Uvicorn on port **8000**.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-1ocnj .
```

## Run

```bash
docker run -p 8000:8000 horse-api-1ocnj
```

## Verify

Once running, the application is accessible at:

```
http://localhost:8000/
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application.

## VERSION File

A `VERSION` file is generated at build time containing the UTC timestamp of the image build:

```
/app/VERSION
```

## Secrets Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`
