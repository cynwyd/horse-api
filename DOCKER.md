# horse-api-g3kkz — Docker Instructions

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

- **Service name:** `horse-api-g3kkz`
- **Port:** `8000` (HTTP)
- **Health check:** `GET /` → `200 OK`

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-g3kkz .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-g3kkz
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start the application. The following can be optionally overridden at runtime:

| Variable | Description | Default |
|---|---|---|
| *(none)* | No required environment variables | — |

---

## VERSION File

The image includes a `/app/VERSION` file with the service name and build timestamp:

```
horse-api-g3kkz
Built: <ISO-8601 timestamp>
```

To inspect it:

```bash
docker run --rm horse-api-g3kkz cat /app/VERSION
```

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any secrets as environment variables.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) for secret management.
