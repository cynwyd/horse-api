# horse-api-ljahw — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-ljahw`
- **Port:** `8000` (HTTP)
- **Health check endpoint:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ljahw .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ljahw
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

No environment variables are required to start this application.

---

## Secret Handling

If secrets are introduced in future versions, use the following managed approaches:

- **Amazon ECS:** [Inject secrets via AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **Amazon EKS:** [Manage secrets via Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn logs are written to stdout — compatible with ECS/CloudWatch log collection.
- The `VERSION` file at `/app/VERSION` contains the UTC build timestamp (e.g., `2024-01-15T10:30:00Z`).
