# Docker Instructions — horse-api-k2shx

## Overview

This is a Python FastAPI application served by uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-k2shx .
```

## Run

```bash
docker run -p 8000:8000 horse-api-k2shx
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

## Health Check

| Property | Value |
|---|---|
| Path | `/` |
| Expected HTTP Status | `200` |
| Port | `8000` |

## Environment Variables

No environment variables are required to start the application.

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces.
- A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.
- For secret management in ECS, use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html).
- For secret management in EKS, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
