# Docker Instructions — horse-api-t6ylo

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-t6ylo`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → HTTP 200
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the Docker build

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-t6ylo .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-t6ylo
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

The image includes a `/app/VERSION` file containing the UTC build timestamp:

```bash
docker run --rm horse-api-t6ylo cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests — do **not** hardcode values in the Dockerfile.

---

## Secret Handling

For sensitive configuration values, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
