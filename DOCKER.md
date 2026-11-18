# horse-api-yhxwr — Docker Build & Run Guide

## Overview

A FastAPI HTTP API service served by uvicorn, running on port **8000**.

---

## Prerequisites

- Docker installed and running
- Access to the source repository root

---

## Build

Run the following from the **root of the extracted source directory**:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-yhxwr .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-yhxwr
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

No environment variables are required to start the application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- A `VERSION` file is included in the image at `/app/VERSION` containing the build timestamp.
- Logs are written to stdout and are compatible with ECS/CloudWatch log collection.
