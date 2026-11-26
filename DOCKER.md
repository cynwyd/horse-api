# Docker Instructions — horse-api-tswm5

## Overview

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

| Property        | Value                  |
|-----------------|------------------------|
| **Image Name**  | `horse-api-tswm5`      |
| **Port**        | `8000`                 |
| **Base Image**  | Amazon Linux 2023      |
| **Runtime**     | Python 3 / Uvicorn     |

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-tswm5 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-tswm5
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

No environment variables are required to start the application. If needed in the future, pass them via `-e` flags or an env file:

```bash
docker run -p 8000:8000 -e MY_VAR=value horse-api-tswm5
```

For production deployments on ECS or EKS, manage secrets using:
- **ECS:** [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Files

| File              | Description                                      |
|-------------------|--------------------------------------------------|
| `Dockerfile`      | Container build instructions                     |
| `.dockerignore`   | Files excluded from the Docker build context     |
| `VERSION`         | Build timestamp                                  |
| `main.py`         | FastAPI application entry point                  |
| `requirements.txt`| Python dependencies                              |
