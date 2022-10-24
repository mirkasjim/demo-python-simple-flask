FROM uselagoon/lagoon-cli:latest as LAGOONCLI
FROM uselagoon/python-3.9:latest

RUN apk add --no-cache curl

COPY --from=LAGOONCLI /lagoon /usr/local/bin/lagoon
RUN DOWNLOAD_PATH=$(curl -sL "https://api.github.com/repos/uselagoon/lagoon-sync/releases/latest" | grep "browser_download_url" | cut -d \" -f 4 | grep linux_386) && wget -O /usr/local/bin/lagoon-sync $DOWNLOAD_PATH && chmod +x /usr/local/bin/lagoon-sync

COPY . /app
RUN mkdir -p -v -m775 /app/storage/

# Thanks to: https://pythonspeed.com/articles/activate-virtualenv-dockerfile/
ENV VIRTUAL_ENV=/opt/venv
RUN python3 -m venv $VIRTUAL_ENV
ENV PATH="$VIRTUAL_ENV/bin:$PATH"

WORKDIR /app

# Install dependencies:
COPY requirements.txt .
RUN pip install -r requirements.txt

CMD ["/bin/docker-sleep"]
