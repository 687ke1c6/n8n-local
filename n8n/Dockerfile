FROM    node:bookworm-slim

RUN     apt update && apt upgrade -y

RUN     npm install -g n8n@next

RUN     apt install ffmpeg -y
RUN     apt install nmap ncat -y 
RUN     apt install openssh-client -y
# Outlook Transport Neutral Encoding Format
RUN     apt install tnef -y

USER    node
