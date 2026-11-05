# Docker Instructions — horse-api-un3hn

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Service name:** `horse-api-un3hn`
- **Port:** `8000`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Runtime user:** `appuser` (non-root)

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-un3hn .
```

## Run

```bash
docker run -p 8000:8000 horse-api-un3hn
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

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of the image build. To inspect it:

```bash
docker run --rm horse-api-un3hn cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Notes

- The application binds to `0.0.0.0:8000` for container compatibility.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
