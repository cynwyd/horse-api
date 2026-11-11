# Docker Instructions — horse-api-utaf5

## Overview

A FastAPI-based REST API service running on Python 3 with uvicorn, served on port **8000**.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-utaf5 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-utaf5
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

No environment variables are required by the application at this time.

For secret handling in production, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.
- The service name is `horse-api-utaf5` (suffix `-utaf5` applied per project requirements).
- No `index.js` was found in the repository; the uvicorn server is configured to bind to `0.0.0.0` directly in the Dockerfile `CMD`.
