FROM alpine
ENV PS1='[truffle@docker $PWD]\$ '
RUN apk update \
      && apk add curl \
      && apk add npm \
      && mkdir -p /workspace \
      && npm install -g truffle
WORKDIR /workspace
CMD /bin/sh