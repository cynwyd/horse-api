# Docker Build & Run Instructions — horse-api-4zffr

## Overview

| Property | Value |
|---|---|
| **Language** | Python 3.9 |
| **Framework** | FastAPI 0.111.0 |
| **ASGI Server** | Uvicorn 0.30.1 |
| **Base Image** | `public.ecr.aws/amazonlinux/amazonlinux:2023` |
| **Exposed Port** | `8000` (HTTP) |
| **Service Name** | `horse-api-4zffr` |

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-4zffr .
```

## Run

```bash
docker run -p 8000:8000 horse-api-4zffr
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

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-4zffr cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. The application is self-contained with no external dependencies (database, cache, messaging).

## Secret Handling

For production deployments, use the following to manage any future secrets:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
