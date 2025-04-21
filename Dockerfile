FROM python:3.13.3-bookworm

RUN mkdir /app
WORKDIR /app
COPY * /app/

#RUN apt update && apt install -y nginx && apt clean && rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt

# TODO: Cleanup, install uwsgi, run nginx

ENTRYPOINT ["uwsgi", "--http", "127.0.0.1:9090", "-w", "app:app"]
