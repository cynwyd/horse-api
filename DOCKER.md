# Docker Instructions — horse-api-nadc1

## Overview

A FastAPI-based REST API served by uvicorn on port `8000`.

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-nadc1 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-nadc1
```

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## VERSION File

A `VERSION` file is generated at build time containing the UTC timestamp of the image build:

```bash
docker run --rm horse-api-nadc1 cat /app/VERSION
```

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn)      |

## Environment Variables

No environment variables are required to start the application.

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` for container compatibility.
- Service name: `horse-api-nadc1`
