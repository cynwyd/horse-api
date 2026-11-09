# Docker Instructions — horse-api-xohdd

## Overview

This is a Python FastAPI application served by Uvicorn, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-xohdd`
- **Language:** Python 3.9
- **Framework:** FastAPI `0.111.0`
- **Server:** Uvicorn `0.30.1`
- **Exposed port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → HTTP 200
- **VERSION file:** `/app/VERSION` — contains the UTC build timestamp (e.g. `2026-11-09T16:16:45Z`)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-xohdd .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-xohdd
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

## Inspect VERSION file

```bash
docker run --rm horse-api-xohdd cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start this application. Any future configuration (e.g. database URLs, API keys) should be injected at runtime via:

- **ECS:** [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- No `index.js` file was found in this repository; the hostname update instruction was not applicable.
