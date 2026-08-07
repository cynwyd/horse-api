# Docker Instructions — horse-api-lgw6o

## Overview

A Python FastAPI application served by Uvicorn on port `8000`.

A `VERSION` file containing the build timestamp (UTC) is embedded at `/app/VERSION` inside the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-lgw6o .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-lgw6o
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

## View VERSION File

```bash
docker run --rm horse-api-lgw6o cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests — do **not** hardcode values in the Dockerfile.

---

## Secret Handling

For sensitive configuration, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
