# Docker Instructions — horse-api-p9yzr

## Overview

A FastAPI-based HTTP API service served by Uvicorn, running as a non-root user (`appuser`) on port `8000`.

The image includes a `VERSION` file at `/app/VERSION` containing the UTC timestamp of when the image was built.

The service name label `horse-api-p9yzr` is applied to the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-p9yzr .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-p9yzr
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

## Verify VERSION File

```bash
docker run --rm horse-api-p9yzr cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application. The following can be overridden at runtime if needed:

| Variable | Description | Default |
|---|---|---|
| *(none)* | No required environment variables | — |

---

## Ports

| Port | Protocol | Description |
|---|---|---|
| `8000` | HTTP | FastAPI application served by Uvicorn |

---

## Security Notes

- The container runs as a non-root user (`appuser`).
- No secrets or credentials are embedded in the image.
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any sensitive environment variables.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
