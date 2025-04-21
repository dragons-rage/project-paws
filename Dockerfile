FROM python:3.13.3-bookworm

RUN mkdir /app
WORKDIR /app
COPY * /app

RUN apt update && apt install -y nginx && apt clean && rm -rf /var/lib/apt/lists/*

RUN pip install -r requirements.txt

# TODO: Cleanup, install uwsgi, run nginx

ENTRYPOINT ["/sbin/nginx", "-c", "/app/nginx.conf"]
