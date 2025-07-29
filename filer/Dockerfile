FROM  debian:bookworm-slim

RUN apt update && apt upgrade -y

RUN groupadd -g 1000 debian && useradd -m -u 1000 -g 1000 -d /home/debian debian

COPY --chown=node:node --chmod=+x restart.sh /app/restart.sh
RUN chmod +x /app/restart.sh

RUN apt install -y ncat

WORKDIR /app

USER debian