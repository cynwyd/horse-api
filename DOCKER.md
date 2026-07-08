# Docker Instructions — horse-api-5hybw

## Overview

A minimal Python FastAPI application served by Uvicorn on port **8000**.  
A `VERSION` file containing the build timestamp (UTC) is embedded in the image at `/app/VERSION`.

---

## Build

Run the following command from the **root of the extracted source directory** (the directory containing `Dockerfile`):

```bash
docker build -t horse-api-5hybw .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-5hybw
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

No required environment variables for this application.

---

## Notes

- The container runs as a non-root `appuser` for security.
- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
- For secret handling in production, use [ECS Secrets Manager integration](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html) or [EKS Secrets Manager / KMS encryption](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html).
