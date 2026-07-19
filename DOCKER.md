# horse-api-7ya1r — Docker Instructions

## Overview

A FastAPI-based REST API service running on Python 3 with uvicorn, served on port **8000**.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-7ya1r .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-7ya1r
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

No environment variables are required for this application. All runtime configuration is handled via ECS task definitions or Kubernetes manifests.

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.

---

## Secret Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from all interfaces inside the container.
