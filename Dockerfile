FROM debian:latest

MAINTAINER antvolin@gmail.com

ARG USER_NAME

WORKDIR /bytecoin-work

ADD https://bytecoin.org/storage/wallets/bytecoin_wallet/bytecoin-desktop-20180219-beta-linux64.zip .

RUN apt-get update && apt-get install -y \
	libqt5widgets5 \
	unzip && unzip bytecoin-desktop-20180219-beta-linux64.zip -d /usr/local/bin/ && \
	apt-get -y autoremove && \
	apt-get -y clean && \
	rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' $USER_NAME
USER $USER_NAME
WORKDIR /home/$USER_NAME

CMD ["bytecoin-gui"]
