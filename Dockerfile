FROM node:10-alpine

WORKDIR /app

# if package.json changes, invalidate cache layer
COPY package.json package-lock.json /app/

RUN  npm install

COPY . /app

RUN \
  npm test || exit 1 ; \
  rm -rf node_modules ; \
  npm install --production

USER node

CMD [ "npm", "start" ]

