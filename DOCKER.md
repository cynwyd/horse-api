# Docker Build & Run Instructions — horse-api-cd76e

## Overview

| Property | Value |
|---|---|
| **Service Name** | horse-api-cd76e |
| **Language** | Python 3 |
| **Framework** | FastAPI + Uvicorn |
| **Port** | 8000 (HTTP) |
| **Health Check** | `GET /` → HTTP 200 |

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-cd76e .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-cd76e
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

A `VERSION` file is embedded in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-cd76e cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is self-contained.

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- For production secret management, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
