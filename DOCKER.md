# Docker Instructions — horse-api-vendj

## Overview

A minimal FastAPI application served by uvicorn on port `8000`.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded at `/app/VERSION` inside the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-vendj .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-vendj
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```
GET /
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start the application. The following can be overridden at runtime via ECS task definition or Kubernetes pod spec:

| Variable | Description | Default |
|---|---|---|
| *(none required)* | — | — |

> **Secret handling:** For any secrets added in future, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).

---

## Exposed Ports

| Port | Protocol | Description |
|---|---|---|
| `8000` | HTTP | FastAPI application (uvicorn) |

---

## VERSION File

The image includes a `/app/VERSION` file with the UTC timestamp of the build:

```bash
docker run --rm horse-api-vendj cat /app/VERSION
# Example output: 2026-07-14T12:44:30Z
```
