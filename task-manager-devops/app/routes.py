from fastapi import APIRouter
from models import Task
from typing import List

Task_router = APIRouter()
Tasks = []

@Task_router.get("/tasks", response_model=List[Task])
def get_tasks():
    return Tasks

@Task_router.post("/tasks")
def create_task(task: Task):
    tasks.append(task)
    return {"message": "Task created"}
