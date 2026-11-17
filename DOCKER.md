# Docker Instructions — horse-api-h1gi1

## Overview

This is a FastAPI application served via `uvicorn` on port `8000`.

A `VERSION` file containing the build timestamp (UTC) is included at `/app/VERSION` inside the image.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-h1gi1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-h1gi1
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

## View VERSION File

```bash
docker run --rm horse-api-h1gi1 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
