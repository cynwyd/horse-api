# horse-api-hu369 — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-hu369`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `{"status": "healthy", "message": "Hello from inside the container!"}`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-hu369 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-hu369
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

Check the VERSION file (build timestamp):
```bash
docker run --rm horse-api-hu369 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Secret Handling

For production deployments, use the following to manage secrets:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- A `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
- Uvicorn logs are written to stdout, making them fully compatible with ECS/CloudWatch log collection.
