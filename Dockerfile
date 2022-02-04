FROM python:3.10

ADD . /case

WORKDIR /case

COPY . /case

RUN pip install --no-cache-dir --upgrade -r /case/requirements.txt

CMD ["python", "/case/app/main.py"]
