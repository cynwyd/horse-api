# Docker Instructions — horse-api-jtrri

## Overview

A FastAPI-based REST API served by uvicorn on port **8000**.

- **Language:** Python 3.9
- **Framework:** FastAPI 0.111.0
- **Server:** Uvicorn 0.30.1
- **Service Name:** horse-api-jtrri

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-jtrri .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-jtrri
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

No environment variables are required for this application.

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by uvicorn |

---

## Secret Handling

This application currently has no secrets. If secrets are added in the future, use:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager integration with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Files Included

| File            | Description                                      |
|-----------------|--------------------------------------------------|
| `Dockerfile`    | Container build instructions                     |
| `.dockerignore` | Files excluded from the Docker build context     |
| `VERSION`       | Build timestamp                                  |
| `main.py`       | FastAPI application entry point                  |
| `requirements.txt` | Python dependencies                           |
