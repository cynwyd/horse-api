# Docker Instructions — horse-api-gg90b

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Port:** `8000` (HTTP)
- **Health Check:** `GET /` → `200 OK`
- **Run User:** `appuser` (non-root)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-gg90b .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-gg90b
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-gg90b cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application to start. All configuration is provided at runtime via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
