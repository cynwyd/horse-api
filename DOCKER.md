# Docker Build and Run Instructions

## Service: horse-api-0cycc

A FastAPI-based HTTP API service running on Python 3 with Uvicorn as the ASGI server.

---

## Prerequisites

- Docker installed and running
- Access to the source repository root directory

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-0cycc .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-0cycc
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

## Exposed Ports

| Port | Protocol | Description                        |
|------|----------|------------------------------------|
| 8000 | HTTP     | FastAPI application served by Uvicorn |

---

## VERSION File

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-0cycc cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

---

## Security Notes

- The application runs as a non-root user (`appuser`) inside the container.
- For secret management in production deployments:
  - **ECS:** Use [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** Use [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
