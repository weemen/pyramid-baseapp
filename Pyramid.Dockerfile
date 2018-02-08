FROM python:3.6-alpine

RUN pip install gunicorn
RUN pip install cymysql

COPY . /app
WORKDIR /app
RUN python setup.py develop

RUN adduser -H -D monty
USER monty

CMD ["gunicorn", "--paster", "/conf/settings.ini", "-b", "0.0.0.0:8000", "--reload"]
