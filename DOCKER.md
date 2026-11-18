# Docker Build and Run Instructions — horse-api-to6s7

## Overview

This document describes how to build and run the `horse-api-to6s7` Docker image standalone, outside of any automated pipeline.

- **Language:** Python 3
- **Framework:** FastAPI
- **ASGI Server:** Uvicorn
- **Exposed Port:** `8000`
- **Service Name:** `horse-api-to6s7`

---

## Prerequisites

- Docker installed and running
- Access to the internet (to pull the base image and install dependencies)

---

## Build

The Docker build context must be the root of the extracted source directory (where `main.py` and `requirements.txt` reside).

```bash
# From the root of the extracted source archive:
docker build -t horse-api-to6s7 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-to6s7
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

## VERSION File

A `VERSION` file is embedded in the image at `/app/VERSION` and contains the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-to6s7 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to start the application. Additional configuration can be injected at runtime via `-e` flags or an ECS task definition.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [AWS Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
