# Docker Instructions — horse-api-3rvu8

## Overview

A FastAPI HTTP API served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Exposed Port:** `8000`
- **Health Check:** `GET /` → `200 OK`

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-3rvu8 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-3rvu8
```

The API will be available at: http://localhost:8000

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-3rvu8 cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application.

## Secret Handling

For production deployments, use AWS Secrets Manager to inject any future secrets:
- **ECS:** [Secrets via Secrets Manager in ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets via Secrets Manager in EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
