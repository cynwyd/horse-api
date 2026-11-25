# Docker Instructions — horse-api-2ov4i

## Overview

A FastAPI HTTP API service running on Python 3 with uvicorn. The application exposes port `8000` and serves a health/status endpoint at `/`.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-2ov4i .
```

To embed a specific build timestamp in the `VERSION` file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +"%Y-%m-%dT%H:%M:%SZ")" \
  -t horse-api-2ov4i .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-2ov4i
```

---

## Verify

```bash
curl http://localhost:8000/
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application via uvicorn    |

---

## Health Check

- **Path:** `/`
- **Expected HTTP status:** `200`

---

## Environment Variables

No required environment variables. The application runs with defaults out of the box.

---

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601). To inspect it:

```bash
docker run --rm horse-api-2ov4i cat /app/VERSION
```

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required to start the application.
- For production deployments on ECS, use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) for any future secret environment variables.
- For EKS deployments, use [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
