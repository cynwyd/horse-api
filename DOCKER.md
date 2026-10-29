# Docker Instructions — horse-api-uitqv

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-uitqv`
- **Port:** `8000`
- **Health check endpoint:** `GET /` → `{"status": "healthy", ...}`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-uitqv .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-uitqv
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC timestamp of the image build time.

To inspect it:
```bash
docker run --rm horse-api-uitqv cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

For secret handling in production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0:8000` for container compatibility.
- The `service-name` label is set to `horse-api-uitqv`.
