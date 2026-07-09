# Docker Instructions — horse-api-85p6n

## Overview

A FastAPI-based REST API served by uvicorn on port `8000`.

- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3.9
- **Framework:** FastAPI + uvicorn
- **Exposed port:** `8000`
- **Health check:** `GET /` → HTTP 200

## Build

Run from the root of the extracted source directory:

```bash
docker build -t horse-api-85p6n .
```

## Run

```bash
docker run -p 8000:8000 horse-api-85p6n
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` and contains the UTC timestamp of the image build time.

```bash
docker run --rm horse-api-85p6n cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application.

For secret management in production deployments:
- **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
