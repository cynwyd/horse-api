# horse-api-qaigs — Docker Instructions

## Overview

A lightweight FastAPI HTTP API service. The container runs uvicorn on port `8000` and binds to `0.0.0.0`.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-qaigs .
```

To embed a specific build timestamp in the `VERSION` file:

```bash
docker build \
  --build-arg BUILD_TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ") \
  -t horse-api-qaigs .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-qaigs
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

| Method | Path | Expected Response |
|--------|------|-------------------|
| GET    | `/`  | `200 OK`          |

Example:

```bash
curl http://localhost:8000/
# {"status":"healthy","message":"Hello from inside the container!"}
```

---

## VERSION File

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format).

To inspect it:

```bash
docker run --rm horse-api-qaigs cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application. The following can be injected at runtime if needed:

| Variable | Description | Default |
|----------|-------------|---------|
| *(none)* | No required env vars | — |

For secret management in production, use:
- **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description |
|------|----------|-------------|
| 8000 | HTTP     | FastAPI application (uvicorn) |

---

## Notes

- Runs as non-root user `appuser` for security
- Logs are written to stdout/stderr — compatible with ECS/CloudWatch and Kubernetes logging
- Service name: `horse-api-qaigs`
