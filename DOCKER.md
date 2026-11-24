# Docker Instructions — horse-api-ae5v0

## Overview

This is a FastAPI-based HTTP API service served via `uvicorn`, containerized on Amazon Linux 2023.

- **Service name:** `horse-api-ae5v0`
- **Language:** Python 3
- **Framework:** FastAPI
- **Port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → returns `{"status": "healthy", "message": "Hello from inside the container!"}`

A `VERSION` file is embedded at `/app/VERSION` inside the image, containing the UTC timestamp of the build.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ae5v0 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ae5v0
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Environment Variables

No environment variables are required for the application to start. All configuration is handled via ECS task definitions or Kubernetes manifests in production.

---

## Verify the VERSION file

```bash
docker run --rm horse-api-ae5v0 cat /app/VERSION
```

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0` to accept connections from outside the container.
- Do **not** install the `curl` package on Amazon Linux 2023 — `curl-minimal` is pre-installed and provides the `curl` command.
