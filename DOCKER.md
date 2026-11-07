# horse-api-bd4aw — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn. The service exposes a health/status endpoint on port **8000**.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-bd4aw .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-bd4aw
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

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-bd4aw cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this service. All configuration is self-contained.

---

## Port

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |

---

## Security Notes

- The container runs as a non-root user (`appuser`).
- No secrets or credentials are embedded in the image.
- For production deployments on ECS or EKS, manage any future secrets via:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
