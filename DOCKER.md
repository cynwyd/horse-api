# Docker Build & Run Instructions — horse-api-oxnve

## Overview

| Property | Value |
|---|---|
| **Service Name** | horse-api-oxnve |
| **Language** | Python 3 |
| **Framework** | FastAPI |
| **Server** | Uvicorn (ASGI) |
| **Port** | 8000 (HTTP) |
| **Health Check** | `GET /` → HTTP 200 |

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-oxnve .
```

## Run

```bash
docker run -p 8000:8000 horse-api-oxnve
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

The image includes a `/app/VERSION` file containing the build timestamp (UTC). To inspect it:

```bash
docker run --rm horse-api-oxnve cat /app/VERSION
```

## Environment Variables

No environment variables are required to start this application. Any runtime configuration should be injected via ECS task definitions or Kubernetes ConfigMaps/Secrets.

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
