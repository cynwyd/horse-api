# Docker Instructions — horse-api-axjvc

## Overview

This document describes how to build and run the `horse-api-axjvc` Docker image standalone, outside the automated pipeline.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** Uvicorn
- **Port:** 8000
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

Run the following command from the **root of the extracted source directory** (the directory containing the `Dockerfile`):

```bash
docker build -t horse-api-axjvc .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-axjvc
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

The application exposes a health check endpoint at the root path:

```bash
curl http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## VERSION File

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC build timestamp in ISO 8601 format. To inspect it:

```bash
docker run --rm horse-api-axjvc cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is handled at startup via the uvicorn command.

---

## Secret Handling

If secrets are needed in future iterations, use:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0` to accept connections from all network interfaces inside the container.
- Service name suffix `-axjvc` has been applied as requested.
