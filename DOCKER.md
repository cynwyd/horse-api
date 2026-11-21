# Docker Instructions — horse-api-sz5js

## Overview

This is a Python FastAPI application served by uvicorn on port **8000**.

- **Service name:** `horse-api-sz5js`
- **Base image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Runtime user:** `appuser` (non-root)
- **Exposed port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → HTTP 200

A `VERSION` file containing the build timestamp (UTC ISO 8601) is included at `/app/VERSION` inside the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-sz5js .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-sz5js
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

No environment variables are required to start this application. All configuration is handled via ECS task definitions or Kubernetes manifests in the deployment pipeline.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
- The service label `service-name=horse-api-sz5js` is embedded in the Docker image metadata.
- No `index.js` was found in this repository; the hostname update instruction was not applicable.
