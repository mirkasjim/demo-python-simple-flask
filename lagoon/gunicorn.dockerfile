ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

# Thanks to: https://pythonspeed.com/articles/activate-virtualenv-dockerfile/
ENV VIRTUAL_ENV=/opt/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app
RUN pip install gunicorn

CMD ["gunicorn","-w","4", "-b","0.0.0.0", "aiohello:app", "--access-logfile=-"]
