# Docker Build and Run Instructions

## Service: horse-api-99m5t

A FastAPI-based HTTP API service running on Python 3 with Uvicorn.

---

## Prerequisites

- Docker installed and running
- Access to the source repository root directory

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-99m5t .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-99m5t
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
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-99m5t cat /app/VERSION
```

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- For secret management in production, use [AWS Secrets Manager with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [AWS Secrets Manager with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
