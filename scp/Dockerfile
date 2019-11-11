FROM alpine:3

WORKDIR /usr/src/app

RUN apk add openssh

COPY scp.sh ./scp.sh
RUN chmod +x ./scp.sh

ENTRYPOINT [ "sh", "/usr/src/app/scp.sh" ]
