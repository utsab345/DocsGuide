FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app/src

WORKDIR /app

COPY src/requirements.txt /app/src/requirements.txt
RUN pip install --no-cache-dir -r /app/src/requirements.txt

COPY src /app/src
COPY data /app/data

EXPOSE 7860
CMD ["sh", "-c", "uvicorn server.main:app --host 0.0.0.0 --port ${PORT:-7860}"]
