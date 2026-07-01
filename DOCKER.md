# horse-api — Docker Build & Run Guide

## Overview

A FastAPI-based HTTP API served by Uvicorn on port **8000**.

A `VERSION` file containing the UTC build timestamp is written to `/app/VERSION` at image build time.

---

## Prerequisites

- Docker installed and running
- No external services required

---

## Build

Run the following command from the **root of the extracted source directory** (the directory containing the `Dockerfile`):

```bash
# From the root of the extracted source archive:
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Verify

```bash
curl http://localhost:8000/
# Expected response:
# {"status":"healthy","message":"Hello from inside the container!"}
```

Check the VERSION file inside the container:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2026-07-01T22:51:30Z
```

---

## Environment Variables

No environment variables are required for this application.

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

## Notes

- The application runs as a non-root user (`appuser`) for security.
- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built (format: `YYYY-MM-DDTHH:MM:SSZ`).
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
