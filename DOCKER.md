# Docker Instructions — horse-api-1lo4v

## Overview

A FastAPI HTTP API service served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI `0.111.0`
- **ASGI Server:** Uvicorn `0.30.1`
- **Service Name:** `horse-api-1lo4v`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-1lo4v .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-1lo4v
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

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC timestamp of when the image was built.

To inspect it:
```bash
docker run --rm horse-api-1lo4v cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. FastAPI and Uvicorn use their built-in defaults.

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
