# Docker Build and Run Instructions

## Overview

`horse-api-tjqn7` is a FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server. The image is built on Amazon Linux 2023 and runs as a non-root user (`appuser`).

A `VERSION` file containing the build timestamp (UTC, ISO 8601 format) is included at `/app/VERSION` inside the image.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-tjqn7 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-tjqn7
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

---

## Secrets Management

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as non-root user `appuser` for security.
- The `VERSION` file at `/app/VERSION` contains the UTC build timestamp in ISO 8601 format.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
