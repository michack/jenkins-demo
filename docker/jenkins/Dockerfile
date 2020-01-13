FROM jenkins/jenkins:lts
COPY files/jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml
COPY files/plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
