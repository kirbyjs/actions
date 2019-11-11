FROM alpine:3

WORKDIR /usr/src/app

RUN apk add openssh

COPY ssh.sh ./ssh.sh
RUN chmod +x ./ssh.sh

ENTRYPOINT [ "sh", "/usr/src/app/ssh.sh" ]
