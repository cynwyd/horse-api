# Docker Build and Run Instructions

## Overview

This is a Python FastAPI application served by Uvicorn on port **8000**.

A `VERSION` file containing the UTC build timestamp is embedded in the image at `/app/VERSION`.

---

## Build

From the root of the extracted source directory:

```bash
docker build -t horse-api .
```

---

## Run

```bash
docker run -p 8000:8000 horse-api
```

The API will be available at: [http://localhost:8000](http://localhost:8000)

---

## Health Check

```
GET http://localhost:8000/
```

Expected response:
```json
{"status": "healthy", "message": "Hello from inside the container!"}
```

---

## Environment Variables

No environment variables are required to run this application.

---

## Notes

- The application runs as a non-root user (`appuser`) for security.
- Uvicorn logs are written to stdout/stderr, compatible with ECS and Kubernetes log collection.
- The `VERSION` file at `/app/VERSION` contains the UTC timestamp of when the image was built.
