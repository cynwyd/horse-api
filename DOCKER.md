# Docker Instructions — horse-api-y7vy1

## Overview

A Python FastAPI application served by Uvicorn on port `8000`.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is written to `/app/VERSION` at image build time.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-y7vy1 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-y7vy1
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Verify VERSION File

```bash
docker run --rm horse-api-y7vy1 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

For secret handling in production, use:
- **ECS**: [Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces.
- Service name: `horse-api-y7vy1`
