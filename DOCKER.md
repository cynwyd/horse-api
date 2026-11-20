# Docker Instructions — horse-api-sux3p

## Overview

A FastAPI REST API service served by uvicorn on port 8000.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-sux3p .
```

## Run

```bash
docker run -p 8000:8000 horse-api-sux3p
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

A `VERSION` file containing the UTC build timestamp is included at `/app/VERSION` inside the image.

```bash
docker run --rm horse-api-sux3p cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn)      |

## Environment Variables

No environment variables are required to start the application.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments, manage secrets via:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
