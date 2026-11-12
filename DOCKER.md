# horse-api-922oa — Docker Build & Run Guide

## Overview

This is a FastAPI Python web service served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-922oa`
- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI server:** Uvicorn
- **Port:** `8000` (HTTP)
- **Health endpoint:** `GET /` → `{"status": "healthy", "message": "Hello from inside the container!"}`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of when the image was built

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-922oa .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-922oa
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

Check the VERSION file inside the container:
```bash
docker run --rm horse-api-922oa cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application to start. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes pod specs — do **not** hardcode values in the Dockerfile.

---

## Secret Handling

For production deployments, use:
- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- The `VERSION` file at `/app/VERSION` contains the UTC build timestamp (e.g., `2026-11-12T02:36:55Z`).
