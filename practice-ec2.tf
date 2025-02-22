provider "aws"{
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}
variable "region" {
    default = "us-east-1"
  
}

variable "tags" {
   type = list
   default = ["priyannka1","priyannka2","priyannka3"]
}

variable "ami" {
    type = map
    default = {
        "us-east-1"= "ami-0453ec754f44f9a4a"
    }
}

resource "aws_key_pair" "my-key" {
    key_name = "n1"
    public_key = file("${path.module}/rsa_pub.txt")
  
}

resource "aws_instance" "ec2-11" {
    ami = lookup(var.ami,var.region)
    instance_type = "t2.micro"
    key_name = "n1"
    count = 3
    tags = {
       Name = element(var.tags,count.index)
    }
}