# Docker Instructions — horse-api-ggnfy

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-ggnfy`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` (contains the UTC build timestamp)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ggnfy .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ggnfy
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
docker run --rm horse-api-ggnfy cat /app/VERSION
# Expected: 2024-01-01T00:00:00Z (UTC build timestamp)
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

If secrets are needed in future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (via Secrets Manager or KMS encryption)
