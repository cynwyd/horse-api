# Docker Instructions — horse-api-bvyku

## Overview

A FastAPI Python web service running on uvicorn, bound to `0.0.0.0:8000`.

A `VERSION` file containing the build timestamp is included at `/app/VERSION` inside the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-bvyku .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-bvyku
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

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required at runtime.
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any future secret environment variables.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
