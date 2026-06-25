# Docker Instructions — horse-api-l65jp

## Overview

A minimal FastAPI HTTP API service running on Python 3 with uvicorn.

- **Framework:** FastAPI
- **Port:** `8000`
- **Health check:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-l65jp .
```

## Run

```bash
docker run -p 8000:8000 horse-api-l65jp
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

## Inspect VERSION file

```bash
docker run --rm horse-api-l65jp cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes pod specs.

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
