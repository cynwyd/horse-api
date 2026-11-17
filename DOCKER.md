# Docker Instructions — horse-api-zn7sb

## Overview

This is a Python FastAPI application served via `uvicorn` on port **8000**.

A `VERSION` file containing the build timestamp (UTC) is embedded in the image at `/app/VERSION`.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-zn7sb .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-zn7sb
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

## View VERSION File

```bash
docker run --rm horse-api-zn7sb cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secrets Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served via uvicorn |
