# Docker Instructions — horse-api-68dn0

## Overview

This document describes how to build and run the **horse-api-68dn0** Docker image standalone, outside the automated pipeline.

- **Language**: Python 3
- **Framework**: FastAPI (ASGI via Uvicorn)
- **Port**: `8000`
- **Base Image**: `public.ecr.aws/amazonlinux/amazonlinux:2023`

---

## Build

Run the following command from the **root of the extracted source directory** (the directory containing the `Dockerfile`):

```bash
# From the root of the extracted source archive:
docker build -t horse-api-68dn0 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-68dn0
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

No environment variables are required to start the application. If needed in the future, pass them using the `-e` flag:

```bash
docker run -p 8000:8000 -e MY_VAR=value horse-api-68dn0
```

For production deployments, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) to securely inject secrets as environment variables.

---

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-68dn0 cat /app/VERSION
```

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn listens on `0.0.0.0:8000` to accept connections from outside the container.
- No external dependencies (database, cache, message broker) are required.
