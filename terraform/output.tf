output "instance_public_ip" {
  value = aws_instance.dockerhost.public_ip
}

output "jenkins_endpoint" {
  value = "http://${aws_instance.dockerhost.public_ip}:8080"
}

output "sentry_endpoint" {
  value = "http://${aws_instance.dockerhost.public_ip}:9000"
}
