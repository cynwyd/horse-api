# Docker Instructions — horse-api-gqbir

## Overview

This is a Python FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file containing the build timestamp (UTC, ISO 8601) is embedded at `/app/VERSION` inside the image.

---

## Build

Run the following command from the **root of the extracted source directory**:

```bash
# From the root of the extracted source archive:
docker build -t horse-api-gqbir .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api-gqbir
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

No environment variables are required to start the application. The following can optionally be provided at runtime:

| Variable | Description | Default |
|---|---|---|
| *(none currently required)* | | |

---

## Secrets Handling

For production deployments, use:
- **ECS**: [Secrets Manager integration for ECS](https://docs.aws.amazon.com/AmazonECS/latest/developerguide/secrets-envvar-secrets-manager.html)
- **EKS**: [Secrets Manager or KMS encryption for EKS](https://docs.aws.amazon.com/eks/latest/userguide/security-k8s.html)

---

## VERSION File

The image includes a `/app/VERSION` file with the UTC build timestamp:

```bash
docker run --rm horse-api-gqbir cat /app/VERSION
```

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn binds to `0.0.0.0:8000` for container compatibility.
- Service name: `horse-api-gqbir`
