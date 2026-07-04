# horse-api-k0rqu — Docker Instructions

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI 0.111.0
- **ASGI Server:** Uvicorn 0.30.1
- **Exposed Port:** `8000`
- **Health Endpoint:** `GET /` → `{"status": "healthy", "message": "Hello from inside the container!"}`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-k0rqu .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-k0rqu
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

No environment variables are required to start the application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests — do **not** hardcode values in the Dockerfile.

---

## Secret Handling

For production deployments, manage secrets using:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn listens on `0.0.0.0:8000` to accept connections from outside the container.
