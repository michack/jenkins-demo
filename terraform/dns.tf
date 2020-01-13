resource "aws_route53_zone" "primary_zone" {
  name   = "ec2.internal"
  vpc {
    vpc_id = "${aws_vpc.env_vpc.id}"
  }
}

resource "aws_route53_record" "dockerhost" {
  zone_id = "${aws_route53_zone.primary_zone.zone_id}"
  name    = "dockerhost.ec2.internal"
  type    = "A"
  ttl     = "30"
  records = ["${aws_instance.dockerhost.private_ip}"]
}
