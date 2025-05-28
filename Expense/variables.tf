variable "ec2_instances" {
  type = map(any)
  default = {
    mysql    = "t3.small"
    backend  = "t2.micro"
    frontend = "t2.micro"
  }
}


variable "ami" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "common_tags" {
  type = map(any)
  default = {
    Project     = "Expense"
    Environment = "Dev"


  }
}

variable "zone_id" {
  type    = string
  default = "Z07106382R8OPNWZHVRIY"
}

variable "domain_name" {
  type    = string
  default = "daws81s.icu"
}

variable "ingress_rules" {
    default = [
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "Listening Port 22"
        },
        {
            from_port = 80
            to_port = 80
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "Listening Port 80"
        },
        {
            from_port = 8080
            to_port = 8080
            protocol = "tcp"
            cidr_blocks = ["0.0.0.0/0"]
            description = "Listening Port 8080"
        },

    ]
}