FROM jenkins/jenkins:lts
USER root

# configuration
COPY files/jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml

# plugins
COPY files/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

# docker
RUN apt-get update && apt-get install software-properties-common apt-transport-https ca-certificates -y
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/debian  $(lsb_release -cs) stable"
RUN apt-get update && apt-get install docker-ce -y

# kubectl
RUN curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
RUN touch /etc/apt/sources.list.d/kubernetes.list
RUN echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list
RUN apt-get update && apt-get install -y kubectl

# awscli
RUN apt-get -y install python-pip && pip install awscli

RUN apt-get clean

COPY entrypoint.sh /entrypoint.sh
USER jenkins

ENTRYPOINT ["/entrypoint.sh"]
