# Docker Instructions — horse-api-q39h4

## Overview

A lightweight FastAPI HTTP API service running on Python 3 with uvicorn.

- **Framework:** FastAPI 0.111.0
- **ASGI Server:** Uvicorn 0.30.1
- **Port:** 8000
- **Service Name:** horse-api-q39h4

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-q39h4 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-q39h4
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

No environment variables are required to run this application.

---

## VERSION File

The image includes a `VERSION` file at `/app/VERSION` containing the build timestamp.

```bash
docker run --rm horse-api-q39h4 cat /app/VERSION
```

---

## Secret Handling

For production deployments, use:
- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
