from typing import Annotated
from sqlalchemy.orm import Session
from fastapi import FastAPI, Depends, HTTPException
from database import engine, SessionLocal
import models
 
app = FastAPI()
 
# Create all tables
models.Base.metadata.create_all(bind=engine)
 
# Dependency for DB session
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()
 
# Route to get all Todos
# @app.get("/")
# async def read_all(db: Annotated[Session, Depends(get_db)]):
#     return db.query(models.Todos).all()
db_dependency = Annotated[Session, Depends(get_db)]
 
@app.get("/")
async def read_all(db: db_dependency):
    return db.query(models.Todos).all()
 
@app.get("/todo/{todo_id}")
async def read_todo(db: db_dependency, todo_id: int):
    todo_model = db.query(models.Todos).filter(models.Todos.id == todo_id).first()
    if todo_model is not None:
        return todo_model
    raise HTTPException(status_code = 404, detail = 'Todo Not Found.')
 