# Docker Instructions — horse-api-00jxm

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service Name:** `horse-api-00jxm`
- **Port:** `8000`
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Health Check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-00jxm .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-00jxm
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
# Expected: {"status":"healthy","message":"Hello from inside the container!"}
```

Check the VERSION file inside the container:

```bash
docker run --rm horse-api-00jxm cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- A `VERSION` file containing the build timestamp (UTC ISO 8601) is located at `/app/VERSION`.
- Uvicorn listens on `0.0.0.0:8000` for container compatibility.
- The service name includes the suffix `-00jxm` as requested.
