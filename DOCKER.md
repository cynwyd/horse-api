# Docker Build and Run Instructions

## Service: horse-api-n43za

A FastAPI-based REST API service running on Python 3 with uvicorn.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) for the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-n43za .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-n43za
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

The Docker image includes a `/app/VERSION` file containing the build timestamp (UTC):

```bash
docker run --rm horse-api-n43za cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

For production deployments on ECS or EKS, manage any secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Exposed Ports

| Port | Protocol | Description              |
|------|----------|--------------------------|
| 8000 | HTTP     | FastAPI application port |
