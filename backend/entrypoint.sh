#!/bin/sh
# Wait for DB to be ready, then upgrade
alembic upgrade head
# Start the FastAPI server
exec uvicorn main:app --host 0.0.0.0 --port 8000