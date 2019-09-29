FROM node:10.0-alpine
RUN apk --update add tzdata \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && apk del tzdata
RUN echo "Asia/Shanghai" > /etc/timezone
RUN mkdir -p /usr/src/nodejs
WORKDIR /usr/src/nodejs
COPY package.json /usr/src/nodejs/package.json
RUN cd /usr/src/nodejs
RUN npm i --production
COPY . /usr/src/nodejs
EXPOSE 30010
CMD npm start