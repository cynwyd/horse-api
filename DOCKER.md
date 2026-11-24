# horse-api-px0kw — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn.

- **Service name:** `horse-api-px0kw`
- **Port:** `8000`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Run as:** `appuser` (non-root)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-px0kw .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-px0kw
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

No environment variables are required for this application. All configuration is self-contained.

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Secret Handling

If secrets are needed in future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager / KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
