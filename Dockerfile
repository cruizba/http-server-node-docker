FROM node:lts

ARG VERSION

RUN npm install -g http-server@"${VERSION}"

ENTRYPOINT ["http-server"]