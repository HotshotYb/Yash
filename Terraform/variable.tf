variable "ami_type" {
    type = string
    default = "ami-010aff33ed5991201"
}

# variable "instance_type" {
#   type = string
#   default = "t2.micro"
# }

# variable "elb_name" {
#   type = string
# }

# variable "az" {
#   type = list
# }

# variable "timeout" {
#   type = number
# }

# variable "vpc_name" {
#   type = string
#   default = "vpc1"
# }

# variable "vpc_cidr" {
#   type = string
#   default = "10.0.0.0/17"
# }

# variable "vpc_azs" {
#   type = list(string)
#   default = ["ap-sout-1a", "ap-south-1b"]
# }

# variable "vpc_private_subnets" {
#   type = list(string)
#   default = ["10.0.1.0/24", "10.0.2.0/24"]
# }

# variable "vpc_public_subnets" {
#   type = list(string)
#   default = ["10.0.101.0/24", "10.0.102.0/24"]
# }

variable "imap" {
  type = map(string)
  default = {
    "default" = "t2.micro"
    "prod" = "t2.medium"
    "test" = "t2.nano"
  }
}