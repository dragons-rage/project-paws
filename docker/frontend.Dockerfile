FROM ghcr.io/astral-sh/uv:alpine
RUN mkdir /app /var/run/apps && chmod 777 /var/run/apps
WORKDIR /app
COPY ./django /app/
RUN uv sync --no-cache

EXPOSE 5000
VOLUME ["/var/run/apps"]

ENTRYPOINT ["uv", "run", "gunicorn", "--bind", "unix:/var/run/apps/gunicorn.sock", "-m", "007", "--bind", "0.0.0.0:5000", "--workers", "2", "--timeout", "600", "projectpaws.wsgi:application"]
