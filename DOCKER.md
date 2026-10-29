# Docker Build & Run Instructions — horse-api-0agrb

## Overview

| Property | Value |
|---|---|
| **Service Name** | `horse-api-0agrb` |
| **Language** | Python 3 |
| **Framework** | FastAPI (uvicorn) |
| **Exposed Port** | `8000` (HTTP) |
| **Health Check** | `GET /` → HTTP 200 |

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-0agrb .
```

## Run

```bash
docker run -p 8000:8000 horse-api-0agrb
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-0agrb cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

For secret management in production deployments:
- **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
