FROM python:3.9.13-alpine3.15

WORKDIR /app/fastapi

USER root
RUN apk --no-cache add gcc make python3-dev musl-dev
RUN apk --no-cache upgrade

COPY requirements.txt  run_test ./

RUN  pip3 install --no-cache-dir --upgrade -r requirements.txt

ENV PYTHONPATH=/app/fastapi/src

COPY ./src ./test ./

CMD ["uvicorn", "tree_api.main:app", "--host", "0.0.0.0", "--port", "8000"]
