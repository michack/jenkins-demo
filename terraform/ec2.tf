resource "aws_instance" "dockerhost" {
  ami                         = "ami-07d0cf3af28718ef8"
  instance_type               = "${var.instance_size}"
  subnet_id                   = aws_subnet.public_subnets.id
  associate_public_ip_address = true
  key_name                    = aws_key_pair.ssh_public_key.key_name
  vpc_security_group_ids      = [aws_security_group.sg_ssh.id, aws_security_group.sg_jenkins.id, aws_security_group.sg_jenkins_slave.id, aws_security_group.sg_sentry.id]
  user_data                   = file("${path.module}/files/bootstrap.sh")
  tags = {
    "Name" = "dockerhost"
  }
  root_block_device {
    volume_type = "gp2"
    volume_size = 20
  }
}

resource "aws_key_pair" "ssh_public_key" {
  key_name   = "jenkins-demo"
  public_key = var.ssh_public_key
}
