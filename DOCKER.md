# Docker Instructions — horse-api-e3963

## Overview

A lightweight FastAPI REST API served by Uvicorn on port `8000`.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn
- **Service Name:** `horse-api-e3963`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-e3963 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-e3963
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

No environment variables are required for this application. Any future configuration should be injected at runtime via ECS task definitions or Kubernetes manifests — do **not** hardcode values in the Dockerfile.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The `VERSION` file in the image contains the build timestamp and is located at `/app/VERSION`.

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- No `index.js` file was found in this repository; the hostname update instruction was not applicable.
