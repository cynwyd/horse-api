# Docker Instructions — horse-api-1er7i

## Overview

A lightweight FastAPI HTTP API service running on Python 3 with Uvicorn.
The service binds to `0.0.0.0:8000` and includes a `VERSION` file at `/app/VERSION`
containing the UTC timestamp of when the image was built.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-1er7i .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-1er7i
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

No environment variables are required to start the application. The following
can be overridden at runtime if needed:

| Variable | Description | Default |
|---|---|---|
| *(none required)* | The app is self-contained | — |

---

## VERSION File

The image includes a `/app/VERSION` file containing the UTC build timestamp:

```bash
docker run --rm horse-api-1er7i cat /app/VERSION
```

---

## Secrets Handling

This application currently has no secrets. If secrets are added in the future,
use the following approaches depending on your deployment target:

- **ECS:** [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn logs are written to stdout — compatible with ECS/CloudWatch log collection.
- No persistent storage is required; the application is stateless.
