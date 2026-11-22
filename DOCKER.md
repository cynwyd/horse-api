# Docker Instructions — horse-api-bpapt

## Overview

A FastAPI HTTP API service running on Python 3 with uvicorn, served on port **8000**.

A `VERSION` file containing the build timestamp (UTC) is embedded at `/app/VERSION` inside the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-bpapt .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-bpapt
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

## View VERSION File

```bash
docker run --rm horse-api-bpapt cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are embedded in the image.
- For production deployments on ECS, use [AWS Secrets Manager](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) to inject any future secret environment variables.
- For EKS deployments, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
