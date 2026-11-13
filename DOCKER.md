# Docker Instructions — horse-api-51vag

## Overview

This is a Python FastAPI application served by uvicorn. The Docker image is built on Amazon Linux 2023 and runs as a non-root user (`appuser`).

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded in the image at `/app/VERSION`.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-51vag .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-51vag
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

No environment variables are required to start the application.

---

## Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |

---

## Notes

- The container runs as non-root user `appuser` for security.
- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
- For secret handling in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
