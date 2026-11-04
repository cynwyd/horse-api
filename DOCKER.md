# horse-api-dfp5z — Docker Instructions

## Overview

A FastAPI-based HTTP API served by Uvicorn on port **8000**.

A `VERSION` file containing the build timestamp is included at `/app/VERSION` inside the image.

---

## Build

```bash
# From the root of the extracted source directory:
docker build -t horse-api-dfp5z .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-dfp5z
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
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
