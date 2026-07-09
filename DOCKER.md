# Docker Instructions — horse-api

## Overview

A minimal Python FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file containing the UTC build timestamp is written to `/app/VERSION` at image build time.

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

## Health Check

```bash
curl http://localhost:8000/
# Expected response: {"status":"healthy","message":"Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to start the application. If additional configuration is needed in the future, pass them via `-e` flags or an env file:

```bash
docker run -p 8000:8000 -e MY_VAR=value horse-api
```

---

## Verify VERSION File

```bash
docker run --rm horse-api cat /app/VERSION
# Example output: 2024-07-09T20:11:45Z
```

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager / KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
