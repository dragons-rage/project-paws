FROM ghcr.io/astral-sh/uv:alpine
RUN mkdir /app
WORKDIR /app
COPY ./django /app/
RUN uv sync --no-cache

#RUN pip install -r requirements.txt

EXPOSE 9090

#ENTRYPOINT ["uwsgi", "--http-socket", ":9090", "-w", "app:app"]
