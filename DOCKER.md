# Docker Instructions — horse-api

## Overview

A minimal FastAPI service running on Uvicorn, exposing a health/status endpoint on port **8000**.

A `VERSION` file is written to `/app/VERSION` at image build time containing the UTC timestamp of the build.

---

## Build

Run the following command from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
```

The application will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
# Health check
curl http://localhost:8000/

# Check the VERSION file inside the container
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application.

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## Health Check

- **Path:** `GET /`
- **Expected HTTP status:** `200`

---

## Security Notes

- The application runs as a non-root user (`appuser`).
- No secrets or credentials are required.
- If secrets are needed in future, use:
  - **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
