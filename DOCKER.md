# Docker Instructions — horse-api-y6ec7

## Overview

A minimal FastAPI HTTP API service running on Python 3 with Uvicorn.

- **Framework:** FastAPI
- **Server:** Uvicorn
- **Port:** 8000
- **Service Name:** horse-api-y6ec7

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-y6ec7 .
```

To embed a specific build timestamp in the VERSION file:

```bash
docker build --build-arg BUILD_TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ") -t horse-api-y6ec7 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-y6ec7
```

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

No environment variables are required to start this application.

---

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-y6ec7 cat /app/VERSION
```

---

## Secret Handling

For production deployments, manage any secrets via:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
