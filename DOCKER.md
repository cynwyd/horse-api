# Docker Instructions — horse-api-hjfx8

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn as the ASGI server.

- **Service name:** `horse-api-hjfx8`
- **Port:** `8000`
- **Health check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-hjfx8 .
```

## Run

```bash
docker run -p 8000:8000 horse-api-hjfx8
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

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

---

## Secret Handling

For production deployments, use AWS Secrets Manager to inject any future secrets:
- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager integration for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The `VERSION` file is included in the image at `/app/VERSION` with the build timestamp.
- The application runs as a non-root user (`appuser`) for security.
- No `index.js` was found in this repository; the hostname update instruction was not applicable.
