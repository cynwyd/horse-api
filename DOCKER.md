# Docker Instructions — horse-api-w75qj

## Overview

This is a FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-w75qj`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` — contains the build timestamp (UTC)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-w75qj .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-w75qj
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
docker run --rm horse-api-w75qj cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes pod specs — do **not** hardcode values in the Dockerfile.

---

## Secret Handling

For production deployments, manage secrets using:

- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
