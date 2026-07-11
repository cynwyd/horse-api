# Docker Instructions — horse-api-petha

## Overview

A FastAPI HTTP API service served by Uvicorn, running on port **8000**.

- **Service name:** `horse-api-petha`
- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Exposed Port:** `8000`
- **Health Check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-petha .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-petha
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

## Secret Handling

For production deployments, use the following to manage secrets securely:

- **ECS:** [Inject secrets via AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Manage secrets via Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The `VERSION` file in the image contains the build timestamp:

```bash
docker run --rm horse-api-petha cat /app/VERSION
```
