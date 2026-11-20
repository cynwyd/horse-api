# Docker Build & Run Instructions

## Service: horse-api-2lcla

A FastAPI HTTP API served by Uvicorn on port 8000.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-2lcla .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-2lcla
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

No environment variables are required to start this application.

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- A `VERSION` file is included at `/app/VERSION` containing the UTC build timestamp.
- The image is labelled with `service-name=horse-api-2lcla`.
- For secret management in production, use:
  - **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
  - **EKS:** [Secrets management with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html) (via Secrets Manager or KMS encryption)
