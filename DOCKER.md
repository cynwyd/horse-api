# horse-api-libe1 — Docker Instructions

## Overview

A lightweight FastAPI HTTP API service running on Python 3 with uvicorn.

- **Service name:** `horse-api-libe1`
- **Port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-libe1 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-libe1
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
docker run --rm horse-api-libe1 cat /app/VERSION
# Expected: 2024-xx-xxTxx:xx:xxZ  (UTC build timestamp)
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
