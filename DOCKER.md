# Docker Instructions — horse-api

## Overview

A minimal FastAPI HTTP API served by Uvicorn on port **8000**.  
A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded in the image at `/app/VERSION`.

---

## Build

Run the following command from the **root of the extracted source directory** (where the `Dockerfile` resides):

```bash
# From the root of the extracted source archive:
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
# Health / status check
curl http://localhost:8000/

# Inspect the embedded VERSION file
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Notes

- The image runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built (e.g. `2024-07-15T00:56:00Z`).
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) (ECS) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (EKS).
