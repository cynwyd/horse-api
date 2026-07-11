# Docker Instructions — horse-api-irbwl

## Overview

A minimal FastAPI application served by Uvicorn on port `8000`.

- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn (ASGI)
- **Port:** `8000`
- **Service Name:** `horse-api-irbwl`

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is written to `/app/VERSION` at image build time.

---

## Build

```bash
# From the root of the extracted source archive:
docker build -t horse-api-irbwl .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-irbwl
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

## Environment Variables

No environment variables are required to start the application. All runtime configuration should be injected via ECS task definitions or Kubernetes pod specs.

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The image includes a `/app/VERSION` file with the UTC build timestamp:

```bash
docker run --rm horse-api-irbwl cat /app/VERSION
```
