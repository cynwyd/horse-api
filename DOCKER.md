# Docker Instructions — horse-api-qtstz

## Overview

A Python FastAPI application served by Uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-qtstz .
```

## Run

```bash
docker run -p 8000:8000 horse-api-qtstz
```

## Health Check

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is generated at build time at `/app/VERSION` containing the UTC timestamp of the build.

To inspect it:
```bash
docker run --rm horse-api-qtstz cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application.

For production deployments on ECS or EKS, any secrets or credentials should be injected via:
- **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |
