# horse-api-25bux — Docker Build & Run Guide

## Overview

A FastAPI HTTP API service served by uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-25bux`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -t horse-api-25bux \
  .
```

> The `BUILD_TIMESTAMP` build argument is written to `/app/VERSION` inside the image.

---

## Run

```bash
docker run --rm -p 8000:8000 horse-api-25bux
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

---

## Environment Variables

No environment variables are required to start the application. All runtime configuration is passed via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- No `index.js` was found in this repository. The `0.0.0.0` binding is applied via the uvicorn startup command in the Dockerfile.
- The `VERSION` file at `/app/VERSION` contains the build timestamp passed via `BUILD_TIMESTAMP`.
