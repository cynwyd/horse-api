# Docker Instructions — horse-api-gz1rs

## Overview

A FastAPI-based HTTP API service served by uvicorn. The service name is `horse-api-gz1rs`.

- **Language:** Python 3.9
- **Framework:** FastAPI 0.111.0
- **ASGI Server:** uvicorn 0.30.1
- **Port:** 8000 (HTTP)
- **Health Check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-gz1rs .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-gz1rs
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

| Variable       | Description                        | Default          |
|----------------|------------------------------------|------------------|
| `SERVICE_NAME` | Service name identifier            | `horse-api-gz1rs`|

---

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-gz1rs cat /app/VERSION
```

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required to start this service.
- For production deployments on ECS or EKS, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
