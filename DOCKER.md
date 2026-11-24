# Docker Instructions — horse-api-vdjrl

## Overview

A lightweight FastAPI HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-vdjrl`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → HTTP 200
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-vdjrl .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-vdjrl
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

Check the VERSION file inside the container:

```bash
docker run --rm horse-api-vdjrl cat /app/VERSION
# Expected: 2024-xx-xxTxx:xx:xxZ  (UTC build timestamp)
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required.
- For production deployments on ECS or EKS, use AWS Secrets Manager to inject any future secrets:
  - **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager / KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
