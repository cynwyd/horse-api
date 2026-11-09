# Docker Instructions — horse-api-cngp0

## Overview

This is a FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file is generated at image build time containing the build timestamp (UTC ISO-8601 format).

---

## Build

Run the following command from the **root of the extracted source directory** (the directory containing the `Dockerfile`):

```bash
# From the root of the extracted source archive:
docker build -t horse-api-cngp0 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-cngp0
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

No environment variables are required to start this application. All runtime configuration should be injected via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, use the following to manage secrets:
- **ECS**: [Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
