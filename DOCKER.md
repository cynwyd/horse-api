# Docker Instructions — horse-api-z2g6l

## Overview

A lightweight FastAPI REST API served by uvicorn, running on Python 3 / Amazon Linux 2023.

- **Exposed port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → HTTP 200
- **Runs as:** `appuser` (non-root)
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-z2g6l .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-z2g6l
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
# Health check
curl http://localhost:8000/

# Expected response:
# {"status":"healthy","message":"Hello from inside the container!"}

# Check the VERSION file inside the container
docker run --rm horse-api-z2g6l cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

If secrets are needed in future, use:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
