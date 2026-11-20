# Docker Instructions — horse-api-alour

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Service Name:** `horse-api-alour`
- **Port:** `8000` (HTTP)
- **Health Check:** `GET /` → HTTP 200
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-alour .
```

## Run

```bash
docker run -p 8000:8000 horse-api-alour
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the image build time.

To inspect it:
```bash
docker run --rm horse-api-alour cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
