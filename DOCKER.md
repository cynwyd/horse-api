# Docker Instructions — horse-api-uenx0

## Overview

A lightweight FastAPI REST API served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Service Name:** `horse-api-uenx0`
- **Exposed Port:** `8000` (HTTP)
- **Health Check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-uenx0 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-uenx0
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-uenx0 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application. All configuration is handled via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
