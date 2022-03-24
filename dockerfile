FROM ubuntu:latest

RUN apt update && apt install  openssh-server sudo python3 -y 

RUN mkdir -p /run/sshd && \
    useradd -m -s /bin/bash sshuser && \
    usermod -aG sudo sshuser

RUN echo 'root:password' | chpasswd
RUN echo 'sshuser:password' | chpasswd

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

EXPOSE 22

ENTRYPOINT ["/usr/sbin/sshd", "-D"] 
