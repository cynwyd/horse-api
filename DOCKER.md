# horse-api-tsmxc — Docker Instructions

## Overview

| Property | Value |
|---|---|
| **Service Name** | `horse-api-tsmxc` |
| **Language** | Python 3 |
| **Framework** | FastAPI 0.111.0 |
| **ASGI Server** | Uvicorn 0.30.1 |
| **Exposed Port** | `8000` (HTTP) |
| **Health Check** | `GET /` → HTTP 200 |

## Build

Build the image from the **root of the extracted source directory**:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-tsmxc .
```

## Run

```bash
docker run -p 8000:8000 horse-api-tsmxc
```

The API will be available at: http://localhost:8000

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is generated at image build time containing the UTC timestamp of the build:

```bash
docker run --rm horse-api-tsmxc cat /app/VERSION
# Example output: 2024-07-07T08:09:55Z
```

## Environment Variables

No environment variables are required to run this application.

For secret management in production deployments:
- **ECS**: Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces.
- The image label `service-name=horse-api-tsmxc` is set per project requirements.
