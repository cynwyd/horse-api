# Docker Instructions — horse-api-258wt

## Overview

This is a Python FastAPI application served by Uvicorn on port `8000`.

- **Service name:** `horse-api-258wt`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI
- **Port:** `8000`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-258wt .
```

## Run

```bash
docker run -p 8000:8000 horse-api-258wt
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

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of the image build.

```bash
docker run --rm horse-api-258wt cat /app/VERSION
```

## Environment Variables

No environment variables are required to start the application. The following can be overridden at runtime via ECS task definitions or Kubernetes manifests:

| Variable | Description | Default |
|---|---|---|
| *(none required)* | — | — |

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
