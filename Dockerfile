FROM alpine:latest

ENV ARIA2_TOKEN shui.azurewebsites.net

RUN apk update && \
	apk --no-cache upgrade && \
	apk add --no-cache aria2 curl unzip bash

RUN mkdir /aria2 && \
	mkdir /downloads

RUN curl -o rclone-current-linux-amd64.zip https://downloads.rclone.org/rclone-current-linux-amd64.zip \
	&& unzip rclone-current-linux-amd64.zip \
	&& mv /rclone-*-linux-amd64/rclone /usr/bin/ \
	&& rm -rf /rclone-*-linux-amd64 \
	&& rm rclone-current-linux-amd64.zip

ADD aria2.conf /aria2/aria2.conf
ADD *.sh /aria2/

RUN chmod -R 777 /downloads
RUN chmod -R 777 /aria2

EXPOSE 6800
EXPOSE 6881
EXPOSE 6882

CMD /aria2/run.sh
