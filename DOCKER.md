# Docker Instructions — horse-api-zqb75

## Overview

A stateless FastAPI HTTP API served by uvicorn. The image includes a `VERSION` file containing the build timestamp.

- **Language:** Python 3
- **Framework:** FastAPI
- **Port:** `8000`
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Run as:** `appuser` (non-root)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-zqb75 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-zqb75
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

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-zqb75 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required for this application. All configuration is handled via ECS task definitions or Kubernetes manifests.

For secret handling, use:
- **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- `index.js` hostname update was requested but this repository contains no `index.js` (it is a Python project). The uvicorn server is already configured to bind to `0.0.0.0` via the `CMD` instruction.
- Service name suffix `-zqb75` has been applied to the image name: `horse-api-zqb75`.
