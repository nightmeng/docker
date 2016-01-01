FROM ubuntu
 
MAINTAINER nightmeng "nightmeng@gmail.com"
    
# 设置root ssh远程登录密码为123456
RUN echo "root:123456" | chpasswd

# 更新源，安装ssh server
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

# 安装常用工具
RUN apt-get install -y vim git gcc g++

# 容器需要开放SSH 22端口
ENV LC_ALL en_US.utf8
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
