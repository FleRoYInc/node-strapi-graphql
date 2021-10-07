FROM node:lts-alpine
RUN apk update
RUN apk add --no-cache --virtual .build-deps
RUN apk add bash
RUN apk add make && apk add curl && apk add openssh && apk add git && apk add jq
RUN ln -sf /usr/share/zoneinfo/Etc/UTC /etc/localtime
RUN apk -Uuv add groff less gcc python3 python3-dev rust cargo libffi-dev musl-dev openssl-dev
RUN curl -L 'https://bootstrap.pypa.io/get-pip.py' | python3
RUN pip3 install -U cffi certbot
RUN pip3 install awscli
RUN pip3 install awsebcli
RUN apk --purge -v del py-pip
RUN rm /var/cache/apk/*
RUN yarn global add typescript
RUN apt-get remove --purge -y build-essential cargo curl libffi-dev libssl-dev
RUN set -ex
RUN apt-get autoremove -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /root/.cache
RUN rm -rf /root/.cargo
RUN mkdir -p /var/www/letsencrypt
CMD ["/bin/bash"]
