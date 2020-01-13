resource "aws_security_group" "sg_ssh" {
  name        = "${var.env["name"]}-ssh-sg"
  description = "${var.env["name"]} ssh access"
  vpc_id      = aws_vpc.env_vpc.id

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_jenkins" {
  name        = "${var.env["name"]}-jenkins-sg"
  description = "${var.env["name"]} jenkins access"
  vpc_id      = aws_vpc.env_vpc.id

  ingress {
    from_port   = "8080"
    to_port     = "8080"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_sentry" {
  name        = "${var.env["name"]}-sentry-sg"
  description = "${var.env["name"]} sentry access"
  vpc_id      = aws_vpc.env_vpc.id

  ingress {
    from_port   = "9000"
    to_port     = "9000"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sg_jenkins_slave" {
  name        = "${var.env["name"]}-jenkins-slave-sg"
  description = "${var.env["name"]} jenkins slave access"
  vpc_id      = aws_vpc.env_vpc.id

  ingress {
    from_port   = "50000"
    to_port     = "50000"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

