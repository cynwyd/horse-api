# Docker Instructions — horse-api-rhadx

## Overview

A lightweight FastAPI HTTP API served by Uvicorn on port **8000**.

- **Service name:** `horse-api-rhadx`
- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Exposed port:** `8000`
- **Health check endpoint:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-rhadx .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-rhadx
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

No environment variables are required to start the application.

---

## VERSION File

The `VERSION` file included in the image contains the build timestamp:

```bash
docker run --rm horse-api-rhadx cat /app/VERSION
```

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments on **ECS**, use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any future secret environment variables.
- For **EKS**, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for secret management.
