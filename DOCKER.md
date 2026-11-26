# Docker Instructions — horse-api-n6lg7

## Overview

A FastAPI HTTP API service served by Uvicorn, running on port **8000**.

- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI 0.111.0 + Uvicorn 0.30.1
- **Service name:** `horse-api-n6lg7`
- **Runs as:** `appuser` (non-root)

## Build

```bash
# From the root of the extracted source archive:
docker build -t horse-api-n6lg7 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-n6lg7
```

## Verify

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

## Health Check

| Property | Value |
|---|---|
| Path | `/` |
| Expected HTTP code | `200` |
| Port | `8000` |

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of the image build (e.g., `2024-01-15T10:30:00Z`).

```bash
# Inspect the VERSION file:
docker run --rm horse-api-n6lg7 cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application. The following can be used to override runtime behaviour when deploying to ECS or EKS:

| Variable | Description | Default |
|---|---|---|
| *(none currently defined)* | | |

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
