FROM node:stretch

RUN apt update && apt install -y curl ca-certificates psmisc python3 \
	--no-install-recommends && rm -r /var/lib/apt/lists/*
RUN curl https://raw.githubusercontent.com/v2ray/v2ray-Panel/master/tools/install_debian.sh | bash
WORKDIR /usr/local/v2ray-panel/v2ray-Panel/ 
RUN chmod +x ./tools/*.sh
