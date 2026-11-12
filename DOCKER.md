# Docker Build and Run Instructions

## Service: horse-api-36gj8

A FastAPI-based REST API served by Uvicorn on port 8000.

---

## Build

Build the Docker image from the root of the extracted source directory:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-36gj8 .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-36gj8
```

The API will be available at: http://localhost:8000

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

For production deployments, manage secrets using:
- **ECS**: [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [AWS Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The image runs as a non-root user (`appuser`) for security.
- A `VERSION` file containing the build timestamp is located at `/app/VERSION` inside the container.
- The service label `service-name=horse-api-36gj8` is embedded in the image metadata.
- Uvicorn binds to `0.0.0.0:8000` for container compatibility.
