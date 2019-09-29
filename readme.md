#### 基础命令
docker images  
docker ps  
docker ps --all  
docker container run  
docker pull nginx  
docker logs -f  <container id>  
docker exec -it <container id> /bin/sh  
docker login  
#### 其他命令
// 构建 hello-docker 镜像文件  
docker image build -t hello-docker .  

// 运行 hello-docker 镜像文件  
docker container run -d -p 30000:30010 hello-docker  
docker container run --name nginxserver -d -p 8081:80 nginx  

// docker image tag [imageName] [username]/[repository]:[tag]  
$ docker image tag hello-docker mayjun/hello-docker  

// docker image push [username]/[repository]:[tag]  
$ docker image push mayjun/hello-docker  

$ docker container kill 1febfb05b850 # 停止容器  
$ docker rm 1febfb05b850 # 删除容器  
$ docker rmi 9be467fd1285 # 删除镜像  
$ docker rmi yaolynzc/hello-docker # 指定 repository 和 tag 来删除镜像

#### 参考资料
https://cnodejs.org/topic/5d8c0df7e86cfb0d2a645c61  
https://cnodejs.org/topic/5d8d6274e86cfb0d2a6460ee  