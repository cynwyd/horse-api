# Docker Instructions — horse-api-div7h

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port `8000`.

- **Service name:** `horse-api-div7h`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Language:** Python 3.9
- **Framework:** FastAPI `0.111.0` + Uvicorn `0.30.1`
- **Exposed port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → `200 OK`

---

## Build

```bash
# From the root of the extracted source archive:
docker build -t horse-api-div7h .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-div7h
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-div7h cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

For secret management in production deployments:
- **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
