# Docker Instructions — horse-api

## Overview

A lightweight FastAPI REST API served by Uvicorn on port **8000**.

A `VERSION` file containing the UTC build timestamp is embedded at `/app/VERSION` inside the image.

---

## Build

Run the following command from the **root of the extracted source directory** (the directory containing the `Dockerfile`):

```bash
# From the root of the extracted source archive:
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required for this application.

---

## Secrets Management

For production deployments, use the following AWS services to manage secrets:
- **ECS**: [Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built. To inspect it:

```bash
docker run --rm horse-api cat /app/VERSION
```
