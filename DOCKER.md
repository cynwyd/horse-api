# horse-api-j5sik — Docker Build & Run Guide

## Overview

A FastAPI-based REST API service running on Python 3 with uvicorn. The service exposes a single HTTP endpoint and is containerized using Amazon Linux 2023.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-j5sik .
```

To include a build timestamp in the `VERSION` file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-j5sik .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-j5sik
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

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

---

## Environment Variables

No environment variables are required to run this application. All runtime configuration is handled via ECS task definitions or Kubernetes manifests in production.

---

## VERSION File

The `VERSION` file at `/app/VERSION` inside the container contains the build timestamp passed via the `BUILD_TIMESTAMP` build argument. If the argument is not provided, the file will be empty.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For production deployments, manage secrets using:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
