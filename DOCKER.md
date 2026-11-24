# Docker Instructions — horse-api-se674

## Overview

A lightweight FastAPI HTTP API service that returns a health/status response.

- **Language:** Python 3
- **Framework:** FastAPI 0.111.0
- **ASGI Server:** Uvicorn 0.30.1
- **Exposed Port:** `8000`
- **Service Name:** `horse-api-se674`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-se674 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-se674
```

## Health Check

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
docker run --rm horse-api-se674 cat /app/VERSION
```

## Environment Variables

No environment variables are required by this application.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production deployments:
  - **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
