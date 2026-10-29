# Docker Instructions — horse-api-sni9n

## Overview

A Python FastAPI application served by uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-sni9n`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

---

## Build

Run the following command from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-sni9n .
```

To embed a build timestamp in the `VERSION` file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-sni9n .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-sni9n
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

No environment variables are required for this application. All runtime configuration is injected via ECS task definitions or Kubernetes manifests.

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

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
