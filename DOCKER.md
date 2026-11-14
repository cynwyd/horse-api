# horse-api-otncj — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API served by Uvicorn on port **8000**.

- **Service Name:** `horse-api-otncj`
- **Language:** Python 3
- **Framework:** FastAPI + Uvicorn
- **Exposed Port:** `8000` (HTTP)
- **Health Check:** `GET /` → `200 OK`

---

## Prerequisites

- Docker installed and running
- No external dependencies (database, cache, messaging) required

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-otncj .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-otncj
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

No environment variables are required for this application.

For secret handling in production deployments, use:
- **ECS:** [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The `VERSION` file in the image contains the build timestamp:

```bash
docker run --rm horse-api-otncj cat /app/VERSION
```
