variable "ami" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "vpc_security_group_ids" {
  type    = list(string)
  default = ["sg-08544cbe0920c82a5"]
}
variable "tags" {
  type = map(any)
  default = {
    Environment = "Dev"
    Project     = "Expense"
    Name        = "Ec2_server"

  }
}
