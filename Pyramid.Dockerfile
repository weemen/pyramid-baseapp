FROM python:3.6-alpine

RUN pip install gunicorn
RUN pip install eventsourcing

COPY . /app
WORKDIR /app
RUN python setup.py develop

VOLUME ['/conf']

RUN adduser -H -D monty
USER monty

CMD ["gunicorn", "--paster", "/conf/settings.ini", "-b", "0.0.0.0:8000"]
