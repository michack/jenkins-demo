FROM jenkinsci/ssh-slave
RUN apt update && apt -y install apt-transport-https ca-certificates curl software-properties-common
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
RUN cd /tmp && curl -O https://download.docker.com/linux/ubuntu/dists/bionic/pool/edge/amd64/containerd.io_1.2.2-3_amd64.deb && apt install /tmp/containerd.io_1.2.2-3_amd64.deb
RUN apt update && apt -y install docker-ce && apt-get clean
RUN groupadd -g 115 docker_jenkins && usermod -G docker_jenkins jenkins
RUN ln -s /usr/local/openjdk-8/bin/java /usr/bin/java
