# Docker Build & Run Instructions — horse-api-umtxo

## Overview

This is a FastAPI application served by uvicorn on port **8000**.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-umtxo .
```

To include a `VERSION` file with a build timestamp:

```bash
docker build --build-arg BUILD_TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)" -t horse-api-umtxo .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-umtxo
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

No environment variables are required to start the application.

---

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Port

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application via uvicorn |
