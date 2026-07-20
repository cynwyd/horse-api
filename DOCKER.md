# Docker Instructions — horse-api-t9lwj

## Overview

This is a Python FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file containing the build timestamp (UTC) is embedded in the image at `/app/VERSION`.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-t9lwj .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-t9lwj
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

No environment variables are required to run this application.

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
- To inspect the VERSION file: `docker run --rm horse-api-t9lwj cat /app/VERSION`
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
