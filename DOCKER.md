# Docker Instructions — horse-api-l8sym

## Overview

A FastAPI HTTP API service running on Python 3 with uvicorn, containerized on Amazon Linux 2023.

- **Service Name:** `horse-api-l8sym`
- **Port:** `8000`
- **Health Check:** `GET /` → `200 OK`
- **VERSION file:** `/app/VERSION` (contains the build timestamp in ISO 8601 UTC format)

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-l8sym .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-l8sym
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
docker run --rm horse-api-l8sym cat /app/VERSION
# Expected: 2024-01-01T00:00:00Z  (ISO 8601 UTC build timestamp)
```

---

## Environment Variables

No environment variables are required to start the application. The following can optionally be passed at runtime:

| Variable | Description | Default |
|---|---|---|
| *(none required)* | — | — |

---

## Secret Handling

For production deployments, use:
- **ECS:** [AWS Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- Uvicorn is bound to `0.0.0.0:8000` for container compatibility.
- Logs are written to stdout — compatible with ECS/CloudWatch log collection.
- The `LABEL service-name="horse-api-l8sym"` is set in the image metadata.
