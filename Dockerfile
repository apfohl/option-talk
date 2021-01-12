FROM alpine:latest

ENV ENV /etc/profile

RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk update
RUN apk add mdp

RUN mv /etc/profile.d/color_prompt /etc/profile.d/color_prompt.sh
RUN mkdir -p /data

WORKDIR /data

ENTRYPOINT ["/bin/sh"]
