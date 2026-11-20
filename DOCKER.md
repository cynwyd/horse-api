# Docker Instructions — horse-api-6qmaw

## Overview

A simple FastAPI HTTP API service running on Python 3 with uvicorn.

- **Framework:** FastAPI
- **Port:** 8000
- **Health check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-6qmaw .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-6qmaw
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

## Secret Handling

For production deployments, use:
- **ECS:** [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The `VERSION` file contains the build timestamp and is included in the image at `/app/VERSION`.
