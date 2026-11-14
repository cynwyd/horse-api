# Docker Instructions — horse-api-ufxlx

## Overview

This is a FastAPI application served by uvicorn on port `8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ufxlx .
```

## Run

```bash
docker run -p 8000:8000 horse-api-ufxlx
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

A `VERSION` file is generated at build time and stored at `/app/VERSION` inside the container. It contains the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-ufxlx cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application.

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to manage any sensitive environment variables.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for secret management.

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |
