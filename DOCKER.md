# Docker Instructions — horse-api-n3v2z

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service Name:** `horse-api-n3v2z`
- **Port:** `8000`
- **Base Image:** `public.ecr.aws/amazonlinux/amazonlinux:2023`
- **Health Check:** `GET /` → HTTP 200

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-n3v2z .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-n3v2z
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

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-n3v2z cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

For production deployments on ECS or EKS, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- No `index.js` file was found in this repository; the hostname update instruction was not applicable.
