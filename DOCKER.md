# Docker Instructions — horse-api-3v67y

## Overview

A minimal FastAPI HTTP API service served via `uvicorn`. The service exposes port `8000` and binds to `0.0.0.0` for container compatibility.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded in the image at `/app/VERSION`.

---

## Build

Run the following command from the **root of the extracted source directory**:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-3v67y .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-3v67y
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

No environment variables are required to run this application.

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via uvicorn    |

---

## Secrets Management

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The image includes a `/app/VERSION` file with the build timestamp:

```bash
docker run --rm horse-api-3v67y cat /app/VERSION
```
