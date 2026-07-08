# Docker Build and Run Instructions

## Service: horse-api-9p4p5

A FastAPI HTTP API service running on Python 3 with uvicorn.

---

## Prerequisites

- Docker installed and running
- Access to `public.ecr.aws` (Amazon ECR Public) to pull the base image

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-9p4p5 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-9p4p5
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

A `VERSION` file is written to `/app/VERSION` at image build time containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-9p4p5 cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- The service label `service-name=horse-api-9p4p5` is embedded in the image metadata.
- For secret management in ECS, use [AWS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html).
- For secret management in EKS, use [AWS Secrets Manager or KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
