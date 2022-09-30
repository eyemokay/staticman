FROM ghcr.io/linuxserver/baseimage-alpine:3.16

RUN apk update && apk add --update nodejs nodejs-npm

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Install app dependencies
COPY package.json /app/
RUN npm install


# Bundle app source
COPY . /app

EXPOSE 3000

ENTRYPOINT [ "/usr/local/bin/npm", "start" ]
