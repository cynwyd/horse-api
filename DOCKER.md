# Docker Instructions — horse-api-8a8d2

## Overview

A lightweight FastAPI HTTP API service served by Uvicorn.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Port:** 8000
- **Health Check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-8a8d2 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-8a8d2
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

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded in the image at `/app/VERSION`.

To inspect it:
```bash
docker run --rm horse-api-8a8d2 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

For production deployments, use the following to manage any future secrets:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager / KMS integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
