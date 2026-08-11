# Docker Instructions — horse-api-ifzpi

## Overview

A Python FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded at `/app/VERSION` inside the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ifzpi .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ifzpi
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```
GET /
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
