FROM python:3.10

WORKDIR /case

COPY ./requirements.txt /case/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /case/requirements.txt

COPY . /case/app

CMD ["python", "/case/app/main.py"]
