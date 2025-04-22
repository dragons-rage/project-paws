FROM python:3.13.3-bookworm

RUN mkdir /app
WORKDIR /app
COPY . /app/

RUN pip install -r requirements.txt

EXPOSE 9090

ENTRYPOINT ["uwsgi", "--http-socket", ":9090", "-w", "app:app"]
