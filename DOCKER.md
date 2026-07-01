# horse-api — Docker Build & Run Instructions

## Overview

A FastAPI application served by Uvicorn on port **8000**.  
A `VERSION` file containing the build timestamp is embedded in the image at `/app/VERSION`.

---

## Prerequisites

- Docker installed and running
- Source code extracted/cloned to a local directory

---

## Build

Run the following command from the **root of the extracted source directory** (where the `Dockerfile` is located).  
Pass the current timestamp as a build argument to populate the `VERSION` file:

```bash
# From the root of the extracted source archive:
docker build \
  --build-arg BUILD_TIMESTAMP="$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
  -t horse-api \
  .
```

---

## Run

```bash
docker run -d \
  --name horse-api \
  -p 8000:8000 \
  horse-api
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response:
# {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required for this application. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

---

## Verify VERSION File

To confirm the `VERSION` file was embedded correctly:

```bash
docker run --rm horse-api cat /app/VERSION
```

---

## Stop & Remove

```bash
docker stop horse-api
docker rm horse-api
```

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
