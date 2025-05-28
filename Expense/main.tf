resource "aws_instance" "ec2_instance" {
  for_each               = var.ec2_instances
  ami                    = data.aws_ami.ami.id
  instance_type          = each.value
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  tags = merge(
    var.common_tags,
    {
      Name = each.key
    }

  )

}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow port no 22 "

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port        = ingress.value["from_port"]
      to_port          = ingress.value["to_port"]
      protocol         = ingress.value["protocol"]
      cidr_blocks      = ingress.value["cidr_blocks"]
      ipv6_cidr_blocks = ["::/0"]

    }
    
  }   
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = merge(
    var.common_tags,
    {

      Name = "allow_ssh"
    }

  )
}

resource "aws_route53_record" "DNS_record" {
  for_each        = aws_instance.ec2_instance
  zone_id         = var.zone_id
  name            = each.key == "frontend" ? var.domain_name : "${each.key}.${var.domain_name}"
  type            = "A"
  ttl             = 1
  records         = each.key == "frontend" ? [each.value.public_ip] : [each.value.private_ip]
  allow_overwrite = true

}






