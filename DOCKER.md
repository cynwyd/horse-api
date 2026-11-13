# Docker Instructions — horse-api-lpa1j

## Overview

This is a FastAPI application served by Uvicorn on port `8000`.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded at `/app/VERSION` inside the image.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-lpa1j .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-lpa1j
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

No environment variables are required to run this application.

---

## VERSION File

The image includes a `/app/VERSION` file with the build timestamp:

```bash
docker run --rm horse-api-lpa1j cat /app/VERSION
```

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` to accept connections from outside the container.
- For secret management in ECS, use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html).
- For secret management in EKS, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
