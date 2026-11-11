# Docker Instructions — horse-api-ovs8m

## Overview

A FastAPI HTTP API service served by uvicorn on port **8000**.

- **Language:** Python 3
- **Framework:** FastAPI
- **Server:** uvicorn
- **Service name:** horse-api-ovs8m

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api-ovs8m .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-ovs8m
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

A `VERSION` file is included in the image at `/app/VERSION` containing the UTC build timestamp (ISO 8601 format). To inspect it:

```bash
docker run --rm horse-api-ovs8m cat /app/VERSION
```

---

## Environment Variables

No environment variables are required to run this application. All configuration is handled at runtime via ECS task definitions or Kubernetes manifests.

---

## Secret Handling

For production deployments, manage secrets using:
- **ECS:** [AWS Secrets Manager integration with ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS:** [Secrets Manager or KMS encryption with EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## Notes

- The container runs as a non-root user (`appuser`) for security.
- uvicorn binds to `0.0.0.0:8000` for container compatibility.
- No `index.js` was found in this repository; the hostname update instruction was not applicable.
- The service-name suffix `-ovs8m` has been applied to the image name (`horse-api-ovs8m`).
