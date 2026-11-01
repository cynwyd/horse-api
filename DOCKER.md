# Docker Build & Run Instructions — horse-api-e4748

## Overview

This is a FastAPI application served by Uvicorn on port `8000`.

A `VERSION` file is generated at build time containing the UTC timestamp of the image build.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-e4748 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-e4748
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

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- The `VERSION` file at `/app/VERSION` contains the UTC build timestamp (ISO 8601 format).
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
