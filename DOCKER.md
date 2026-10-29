# Docker Instructions — horse-api-6k0z1

## Overview

A FastAPI HTTP API service served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Service Name:** `horse-api-6k0z1`
- **Exposed Port:** `8000`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-6k0z1 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-6k0z1
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

## Secret Handling

If secrets are introduced in future versions, use the following AWS-managed approaches:

- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The `VERSION` file is included in the image at `/app/VERSION` and contains the build timestamp.
