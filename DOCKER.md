# horse-api — Docker Build & Run Instructions

## Overview

A FastAPI-based HTTP API served by Uvicorn on port **8000**.  
A `VERSION` file containing the build timestamp (UTC ISO-8601) is embedded at `/app/VERSION` inside the image.

---

## Prerequisites

- Docker installed and running
- No external dependencies required (no database, cache, or messaging service)

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

Check the embedded VERSION file:

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2024-11-26T17:02:45Z
```

---

## Environment Variables

No environment variables are required to start this application.

---

## Exposed Ports

| Port | Protocol | Description                  |
|------|----------|------------------------------|
| 8000 | HTTP     | FastAPI API served by Uvicorn |

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn logs are written to stdout — compatible with ECS/CloudWatch log collection.
- The `VERSION` file at `/app/VERSION` contains the UTC build timestamp in ISO-8601 format.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager / KMS with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
