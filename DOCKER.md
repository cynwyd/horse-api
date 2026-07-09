# horse-api-r4y1f — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service served by Uvicorn. The image includes a `VERSION` file stamped with the build timestamp.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-r4y1f .
```

---

## Run

```bash
docker run --rm -p 8000:8000 horse-api-r4y1f
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
| 8000 | HTTP     | FastAPI application via Uvicorn    |

---

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-r4y1f cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are baked into the image.
- For production deployments on ECS, manage any future secrets via [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html).
- For EKS deployments, use [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
