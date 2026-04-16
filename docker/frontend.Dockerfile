FROM ghcr.io/astral-sh/uv:alpine
RUN mkdir /app
WORKDIR /app
COPY ./django /app/
RUN uv sync --no-cache

#RUN pip install -r requirements.txt

EXPOSE 9090

ENTRYPOINT ["uv", "run", "gunicorn", "--bind", "0.0.0.0:5000", "--workers 2", "--timeout", "600", "app:app"]
