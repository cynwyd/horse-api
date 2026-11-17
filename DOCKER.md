# Docker Instructions — horse-api-p7ins

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service Name:** `horse-api-p7ins`
- **Port:** `8000`
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Health Check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-p7ins .
```

To embed a specific build timestamp in the VERSION file:

```bash
docker build -t horse-api-p7ins --build-arg BUILD_TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ") .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-p7ins
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

---

## Environment Variables

No required environment variables. The application is self-contained.

---

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format).

To inspect it:

```bash
docker run --rm horse-api-p7ins cat /app/VERSION
```

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are embedded in the image.
- For production deployments on ECS or EKS, manage any future secrets via:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
