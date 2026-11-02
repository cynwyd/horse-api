# Docker Instructions — horse-api-hb67v

## Overview

This is a Python FastAPI application served by Uvicorn on port `8000`.

- **Service name:** `horse-api-hb67v`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI
- **Port:** `8000`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-hb67v .
```

## Run

```bash
docker run -p 8000:8000 horse-api-hb67v
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

## Environment Variables

No environment variables are required to run this application.

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
