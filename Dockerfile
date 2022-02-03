FROM python:3.10

WORKDIR /case

COPY ./requirements.txt /case/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /case/requirements.txt

COPY ./app /case/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]