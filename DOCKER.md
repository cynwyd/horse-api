# Docker Instructions — horse-api-jcpp3

## Overview

A lightweight FastAPI REST API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-jcpp3`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-jcpp3 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-jcpp3
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

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-jcpp3 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is handled at the framework level.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- For secret management in production deployments:
  - **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
