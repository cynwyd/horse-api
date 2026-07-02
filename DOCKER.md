# Docker Instructions — horse-api-3bw6o

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn, bound to `0.0.0.0:8000`.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded at `/app/VERSION` inside the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-3bw6o .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-3bw6o
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

No environment variables are required to start the application. If needed in future, they can be passed via:

```bash
docker run -p 8000:8000 -e MY_VAR=value horse-api-3bw6o
```

For production deployments on ECS or EKS, use the following for secret management:
- **ECS:** [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Port

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

---

## VERSION File

The image includes a `/app/VERSION` file with the build timestamp:

```bash
docker run --rm horse-api-3bw6o cat /app/VERSION
```
