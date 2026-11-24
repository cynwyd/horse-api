# Docker Instructions — horse-api-km62w

## Overview

A FastAPI REST API service served by Uvicorn on port **8000**.

---

## Build

Run the following command from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-km62w .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-km62w
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

The image includes a `/app/VERSION` file containing the build timestamp (UTC ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-km62w cat /app/VERSION
```

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
