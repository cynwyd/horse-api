# Docker Instructions — horse-api-ngc54

## Overview

A minimal FastAPI HTTP API service running on Python 3 with uvicorn.

- **Service name:** `horse-api-ngc54`
- **Port:** `8000`
- **Health check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ngc54 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ngc54
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

No environment variables are required to start this application.

---

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-ngc54 cat /app/VERSION
```

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:

- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
