FROM node:16.19.0

RUN apt-get update -y && apt-get upgrade -y

RUN apt-get install -y -f git wget 

RUN apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www

COPY ./package.json .

RUN npm install

COPY . .

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
  && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz