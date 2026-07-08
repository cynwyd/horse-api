# horse-api-mcf43 — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with uvicorn.

- **Framework:** FastAPI
- **Port:** `8000`
- **Health Check:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` — contains the UTC timestamp of the image build

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-mcf43 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-mcf43
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

No environment variables are required to start the application.

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Logs are written to stdout/stderr — compatible with ECS and CloudWatch Logs.
- The `/app/VERSION` file inside the container contains the UTC build timestamp.

---

## Secret Handling

For production deployments, use AWS Secrets Manager to inject any future secrets:
- **ECS:** [Inject secrets via ECS task definitions](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Manage secrets with Secrets Manager or KMS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
