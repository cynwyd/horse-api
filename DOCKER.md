# Docker Instructions — horse-api-xudq1

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.
The image is built on Amazon Linux 2023 and runs as a non-root `appuser`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-xudq1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-xudq1
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

A `VERSION` file is written to `/app/VERSION` at image build time containing the UTC timestamp of the build.

To inspect it:
```bash
docker run --rm horse-api-xudq1 cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

For production deployments on ECS or EKS, any secrets should be managed via:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

## Notes

- The container runs as non-root user `appuser` for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces.
- Service name: `horse-api-xudq1`
