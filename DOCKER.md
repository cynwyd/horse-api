# Docker Instructions — horse-api-m3mlj

## Overview

A lightweight FastAPI HTTP API service that returns health/status responses.

- **Language:** Python 3
- **Framework:** FastAPI
- **Port:** 8000
- **Service Name:** horse-api-m3mlj

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-m3mlj .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-m3mlj
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

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-m3mlj cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Secret Handling

For production deployments, use the following for managing secrets:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
