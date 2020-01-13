#!/bin/bash
apt-get update
apt-get -y install docker.io
sed -i -r 's|^(ExecStart=)(.*)$|\1/usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock -H=tcp://0.0.0.0:4243|' /lib/systemd/system/docker.service
sudo systemctl daemon-reload
sudo service docker restart
docker build https://github.com/michack/jenkins-demo.git#master:docker/jenkins --no-cache -t michack/jenkins
docker run -d -p 8080:8080 --name jenkins michack/jenkins:latest
docker build https://github.com/michack/jenkins-demo.git#master:docker/slave --no-cache -t michack/slave
