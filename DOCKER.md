# Docker Instructions — horse-api-zoatr

## Overview

A lightweight FastAPI REST API service. The application binds to `0.0.0.0:8000` and exposes a single health/status endpoint at `GET /`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-zoatr .
```

## Run

```bash
docker run -p 8000:8000 horse-api-zoatr
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

The image includes a `/app/VERSION` file containing the UTC timestamp at which the image was built.

```bash
docker run --rm horse-api-zoatr cat /app/VERSION
```

## Environment Variables

No environment variables are required to run this application. All configuration is handled at the framework level.

## Exposed Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
