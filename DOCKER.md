# Docker Build and Run Instructions — horse-api-altus

## Overview

| Property | Value |
|---|---|
| **Service Name** | `horse-api-altus` |
| **Language** | Python 3 |
| **Framework** | FastAPI + Uvicorn |
| **Base Image** | `public.ecr.aws/amazonlinux/amazonlinux:latest` (Amazon Linux 2023) |
| **Exposed Port** | `8000` (HTTP) |
| **Health Endpoint** | `GET /` → `200 OK` |

## Build

```bash
# From the root of the extracted source archive:
docker build -t horse-api-altus .
```

## Run

```bash
docker run -p 8000:8000 horse-api-altus
```

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

## Environment Variables

No environment variables are required to start the application.

## Notes

- The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format).
- The application runs as a non-root user (`appuser`) for security.
- The service label `service-name=horse-api-altus` is set on the image.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
