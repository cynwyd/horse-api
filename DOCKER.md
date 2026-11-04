# Docker Instructions — horse-api-6wetk

## Overview

A FastAPI-based HTTP API service served by Uvicorn on port `8000`.  
A `VERSION` file containing the build timestamp is included at `/app/VERSION` inside the image.

---

## Build

Run the following from the **root of the extracted source directory** (where the `Dockerfile` is located):

```bash
docker build -t horse-api-6wetk .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-6wetk
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

No environment variables are required to start the application. All configuration is handled via ECS task definitions or Kubernetes manifests in production.

---

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## VERSION File

The image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built.

```bash
docker run --rm horse-api-6wetk cat /app/VERSION
```

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
