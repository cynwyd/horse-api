# Docker Build and Run Instructions

## Service: horse-api-u0zbi

A FastAPI HTTP API served by Uvicorn on port 8000.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-u0zbi .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-u0zbi
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

The Docker image includes a `/app/VERSION` file containing the UTC timestamp of when the image was built:

```bash
docker run --rm horse-api-u0zbi cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. Any runtime configuration can be injected via `-e` flags or an `.env` file.

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` for container compatibility.
- For production deployments on ECS or EKS, environment variables and secrets should be managed via:
  - **ECS**: [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS**: [Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)
