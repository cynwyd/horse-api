from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"status": "healthy", "message": "Hello from inside the container!"}
