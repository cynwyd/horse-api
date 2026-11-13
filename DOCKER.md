# Docker Instructions — horse-api-yuaea

## Overview

A FastAPI-based REST API served by Uvicorn on port `8000`.

- **Service name:** `horse-api-yuaea`
- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Exposed port:** `8000` (HTTP)

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-yuaea .
```

## Run

```bash
docker run -p 8000:8000 horse-api-yuaea
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is generated at build time containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-yuaea cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application.

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
