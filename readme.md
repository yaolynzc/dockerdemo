#### CentOS7中安装docker-ce
yum remove docker docker-common docker-selinux docker-engine -y  
yum install -y yum-utils device-mapper-persistent-data lvm2  
yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo  
yum makecache fast  
yum install docker-ce -y  

// docker镜像修改为阿里云源
vi /etc/docker/daemon.json  
{  
  &nbsp;&nbsp;"registry-mirrors": ["https://fy707np5.mirror.aliyuncs.com"]  
}  

#### 基础命令
docker images  
docker ps  
docker ps --all  
docker container run  
docker pull nginx  
docker logs -f <Container_ID>:  
docker exec -it <Container_ID> /bin/sh  
docker login  
docker search <IMAGE_ID/NAME>：查找image  
docker pull <IMAGE_ID>：下载image  
docker push <IMAGE_ID>：上传image  
docker rmi <IMAGE_ID>：删除image  

#### 其他命令
// 构建 hello-docker 镜像文件  
docker image build -t hello-docker .  

// 运行 hello-docker 镜像文件  
docker container run -d -p 30000:30010 hello-docker  
docker run --name nginxserver -d -p 8081:80 nginx  

// 容器进入  
docker exec -it <Container_ID> /bin/sh  

// docker服务重启后自动自动container  
docker run --restart=always  
docker update --restart=always <Container_ID>  
示例：docker run --name hello-docker1 --restart=always -d -p 30000:30010 hello-docker  

// docker image tag [imageName] [username]/[repository]:[tag]  
$ docker image tag hello-docker mayjun/hello-docker  

// docker image push [username]/[repository]:[tag]  
$ docker image push mayjun/hello-docker  

$ docker container kill 1febfb05b850 # 停止容器  
$ docker rm 1febfb05b850 # 删除容器  
$ docker rmi 9be467fd1285 # 删除镜像  
$ docker rmi yaolynzc/hello-docker # 指定 repository 和 tag 来删除镜像

#### 导出和导入docker
docker save > nginx.tar nginx:latest  
docker load < nginx.tar  
docker export -o nginx-test.tar nginx-test  
docker import nginx-test.tar nginx:imp  
区别：  
1、export命令导出的tar文件略小于save命令导出的  
2、export命令是从容器（container）中导出tar文件，而save命令则是从镜像（images）中导出  
建议：  
1、若是只想备份images，使用save、load即可  
2、若是在启动容器后，容器内容有变化，需要备份，则使用export、import  

#### docker架构图  
![avatar](https://img.mukewang.com/5d8b488700019f5c17340920.png)

#### 参考资料
https://blog.csdn.net/u013531940/article/details/80037343  
https://cnodejs.org/topic/5d8c0df7e86cfb0d2a645c61  
https://cnodejs.org/topic/5d8d6274e86cfb0d2a6460ee  
https://blog.csdn.net/ncdx111/article/details/79878098  