# Docker Instructions — horse-api

## Overview

A FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Language:** Python 3
- **Framework:** FastAPI `0.111.0` + Uvicorn `0.30.1`
- **Exposed port:** `8000`
- **Health check:** `GET /` → HTTP 200
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

---

## Build

Run the following command from the root of the extracted source directory:

```bash
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: http://localhost:8000

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
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All runtime configuration
should be injected via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, use the following to manage secrets:

- **ECS:** [Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
