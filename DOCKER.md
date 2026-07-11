# Docker Instructions — horse-api-wq43n

## Overview

This is a FastAPI-based HTTP API service (`horse-api-wq43n`) running on Python 3 with Uvicorn, containerized on Amazon Linux 2023.

- **Exposed Port:** `8000` (HTTP)
- **Health Check Endpoint:** `GET /` → `200 OK`
- **Runs as:** `appuser` (non-root)
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of when the image was built

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-wq43n .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-wq43n
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
docker run --rm horse-api-wq43n cat /app/VERSION
# Expected: 2024-01-01T00:00:00Z (UTC timestamp of build time)
```

---

## Environment Variables

No environment variables are required to start this application. All runtime configuration (if needed) should be injected via ECS task definitions or Kubernetes pod specs.

---

## Secret Handling

For any future secrets or credentials, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
