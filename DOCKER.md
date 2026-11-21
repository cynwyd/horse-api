# Docker Instructions — horse-api-ck487

## Overview

A minimal FastAPI HTTP API served by Uvicorn. Exposes a single `GET /` endpoint that returns a health/status response.

- **Language**: Python 3.9
- **Framework**: FastAPI
- **Server**: Uvicorn (ASGI)
- **Port**: `8000`

---

## Build

Run the following command from the root of the extracted source directory:

```bash
docker build -t horse-api-ck487 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ck487
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

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
