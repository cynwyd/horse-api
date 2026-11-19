# Docker Instructions — horse-api-qdn6k

## Overview

A lightweight FastAPI HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Framework:** FastAPI 0.111.0
- **Server:** Uvicorn 0.30.1
- **Port:** 8000
- **Base Image:** public.ecr.aws/amazonlinux/amazonlinux:2023

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-qdn6k .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-qdn6k
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

No environment variables are required to run this application. All runtime configuration is handled via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.
- Uvicorn logs are written to stdout, compatible with Amazon CloudWatch Logs.
