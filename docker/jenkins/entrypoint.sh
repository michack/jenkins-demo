#!/bin/sh
echo "entrypoint.sh start"
whoami
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin ${ECR_REPO_URL}
exec /sbin/tini -- /usr/local/bin/jenkins.sh
