# 使用基于alpine-linux的Node.js v10.0版本环境
FROM node:10.0-alpine
# 在容器中创建一个目录
RUN mkdir -p /data/docker/nodejs
# 定位到容器的工作目录
WORKDIR /data/docker/nodejs
# RUN/COPY 是分层的，package.json 提前，只要没修改，就不会重新安装包
COPY package.json /data/docker/nodejs/package.json
RUN cd /data/docker/nodejs
RUN npm i --production
# 把当前目录下的所有文件拷贝到 Image 的 /data/docker/nodejs/ 目录下
COPY . /data/docker/nodejs
# 对外暴露30010端口并启动应用
EXPOSE 30010
CMD npm start