FROM  node:bookworm-slim

RUN apt update && apt upgrade -y

RUN npm install -g n8n@next

RUN apt install ffmpeg nmap ncat tnef openssh-client -y

USER node
