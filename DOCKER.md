# Docker Build and Run Instructions

## Service: horse-api-tvyyy

A FastAPI HTTP API service served by Uvicorn on port 8000.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-tvyyy .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-tvyyy
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

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- A `VERSION` file is included in the image at `/app/VERSION` with the build timestamp.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
