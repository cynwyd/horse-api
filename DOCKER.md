# Docker Instructions — horse-api-xdnx6

## Overview

A FastAPI-based REST API service running on Python 3 with Uvicorn as the ASGI server.

- **Service Name:** `horse-api-xdnx6`
- **Port:** `8000` (HTTP)
- **Health Check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-xdnx6 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-xdnx6
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

No environment variables are required for this application.

---

## Secret Handling

For production deployments, use the following to manage secrets:

- **ECS:** [Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- A `VERSION` file is included in the image at `/app/VERSION` with the build timestamp.
- Uvicorn logs are written to stdout, making them compatible with ECS/CloudWatch log collection.
