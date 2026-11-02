# Docker Instructions — horse-api-9qaom

## Overview

A FastAPI-based Python REST API service. The application is served by `uvicorn` bound to `0.0.0.0:8000`.

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-9qaom .
```

## Run

```bash
docker run -p 8000:8000 horse-api-9qaom
```

## Verify

Once running, the API is accessible at:

```
http://localhost:8000/
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

## Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

## Environment Variables

No environment variables are required to start the application. All runtime configuration can be injected via ECS task definitions or Kubernetes manifests.

## VERSION File

A `VERSION` file is included at `/app/VERSION` inside the container, containing the UTC timestamp of the image build.

```bash
docker run --rm horse-api-9qaom cat /app/VERSION
```

## Secret Handling

For production deployments, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
