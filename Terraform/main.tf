terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

# Creating an EC2 instance using 
# resource "aws_instance" "EC2-lab1" {
#   ami = var.ami_type  
#   instance_type = var.instance_type
# }

#Creating an EC2 instance
# resource "aws_instance" "EC2-lab2" {
#   ami = "ami-010aff33ed5991201"  
#   instance_type = "t2.micro"
# }

# Creating an elastic IP and attaching it to an instance
# # 
# resource "aws_eip" "eip_assoc" {
#   instance   = "i-0e2d761717d9b4d6e"
#   vpc           = true
# }

# Creating a load balancer
# resource "aws_elb" "LB1" {
#   name               = var.elb_name
#   availability_zones = var.az

#   listener {
#     instance_port     = 8000
#     instance_protocol = "http"
#     lb_port           = 80
#     lb_protocol       = "http"
#   }

#   health_check {
#     healthy_threshold   = 2
#     unhealthy_threshold = 2
#     timeout             = 3
#     target              = "HTTP:8000/"
#     interval            = 30
#   }

#   cross_zone_load_balancing   = true
#   idle_timeout                = var.timeout
#   connection_draining         = true
#   connection_draining_timeout = var.timeout

#   tags = {
#     Name = "ELB terraform"
#   }
# }

# Creating and EC2 Instance using an existing keypair, Using provisioner to run commands on the machine created, and using ssh key to implement those commands and sign into the machine
# resource "aws_instance" "ec2" {
#   ami= "ami-010aff33ed5991201"
#   instance_type = "t2.micro"
#   key_name = "KeyPair2"

#   provisioner "remote-exec" {
#     inline=[
#       "sudo amazon-linux-extras install -y nginx1.12",
#       "sudo systemctl start ngnix"
#     ]
#   }
#   connection {
#     type = "ssh"
#     user = "ec2-user"
#     private_key = file("./KeyPair2.pem")
#     host = self.public_ip
#   }
# }

# # Using a variable for conditional statment, to associate eip on instance
# variable "tagged" {}

# resource "aws_instance" "Ec2prod" {
#   ami = "ami-010aff33ed5991201"
#   instance_type = "t2.micro"

#   tags = {
#     Name=var.tagged
#   }
# }

# resource "aws_eip" "eip1" {
#   vpc = true
# }

# resource "aws_eip_association" "assoc" {
#   instance_id = var.tagged==aws_instance.Ec2prod.tags.Name?aws_instance.Ec2prod.id:0
#   allocation_id = aws_eip.eip1.id  
# }

# Module creation and usage
# module "vpc" {
#   source  = "terraform-aws-modules/vpc/aws"
#   version = "2.21.0"

#   name = var.vpc_name
#   cidr = var.vpc_cidr

#   azs             = var.vpc_azs
#   private_subnets = var.vpc_private_subnets
#   public_subnets  = var.vpc_public_subnets

# }



# module "ec2_instances" {
#   source  = "terraform-aws-modules/ec2-instance/aws"
#   version = "2.12.0"

#   name           = "my-ec2"

#   ami                    = "ami-0c5204531f799e0c6"
#   instance_type          = "t2.micro"
#   subnet_id              = module.vpc.public_subnets[0]
  
#   }


# # Creating a graph for the said infrastructure
# resource "aws_instance" "myec2" {
#    ami = "ami-082b5a644766e0e6f"
#    instance_type = "t2.micro"
# }

# resource "aws_eip" "lb" {
#   instance = aws_instance.myec2.id
#   vpc      = true
# }

# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"

#   ingress {
#     description = "TLS from VPC"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["${aws_eip.lb.private_ip}/32"]

#   }
# }
# https://github.com/zealvora/terraform-beginner-to-advanced-resource/blob/master/Section%202%20-%20Read%2C%20Generate%2C%20Modify%20Congiruations/graph.md -> see this link for reference

# Creating instances based off of workspaces 
resource "aws_instance" "Ec2" {
  instance_type = lookup(var.imap, terraform.workspace)
  ami = var.ami_type
}