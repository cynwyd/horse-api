# horse-api — Docker Build & Run Guide

## Overview

A FastAPI REST API served by Uvicorn on port **8000**.  
A `VERSION` file containing the build timestamp (UTC ISO-8601) is embedded at `/app/VERSION` inside the image.

---

## Prerequisites

- Docker installed and running
- No external dependencies (no database, cache, or messaging service required)

---

## Build

Run the following command from the **root of the extracted source directory** (the directory containing the `Dockerfile`):

```bash
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
```

Expected response:

```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Inspect the VERSION file

```bash
docker run --rm horse-api cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For production deployments, manage any future secrets using:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets management for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) via Secrets Manager or KMS encryption
