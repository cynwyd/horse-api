# Docker Instructions — horse-api-f1zza

## Overview

This is a FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file containing the build timestamp is embedded at `/app/VERSION` inside the image.

---

## Build

Run the following command from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-f1zza .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-f1zza
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

No environment variables are required to start this application.

---

## Secrets Management

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn listens on `0.0.0.0:8000` to accept connections from outside the container.
- The `/app/VERSION` file contains the UTC timestamp of when the image was built.
