# Docker Instructions — horse-api-kdy9r

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-kdy9r`
- **Port:** `8000`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-kdy9r .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-kdy9r
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

No environment variables are required for this application.

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Secret Handling

This application has no secrets. For future secret management in AWS, refer to:
- **ECS:** [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets security](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
