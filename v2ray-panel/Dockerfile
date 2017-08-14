FROM node:stretch

RUN apt update && apt install -y curl ca-certificates python3 \
	--no-install-recommends && rm -r /var/lib/apt/lists/*
RUN curl -O "https://raw.githubusercontent.com/v2ray/v2ray-Panel/master/tools/install_debian.sh" && bash install_debian.sh 
WORKDIR /usr/local/v2ray-panel/v2ray-Panel/ 
RUN chmod +x ./tools/setup_master.sh
#RUN ./tools/setup_master.sh
#CMD v2ray-panel-master
