from fastapi import FastAPI
from routes import task_router

app = FastAPI()
app.include_router(task_router)

@app.get("/health")
def health_check():
    return {"status": "ok"}
