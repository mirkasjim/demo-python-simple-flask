ARG CLI_IMAGE
FROM ${CLI_IMAGE} as cli

FROM uselagoon/nginx:latest

COPY --from=cli /app /app

RUN mkdir -p /etc/nginx/conf.d/gunicorn
COPY lagoon/nginx-gunicorn.conf /etc/nginx/conf.d/app.conf

RUN fix-permissions /etc/nginx

ENV WEBROOT=web
