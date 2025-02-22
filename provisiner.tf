provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}

resource "aws_key_pair" "mykey" {
    key_name = "priya"
    public_key = file("${path.module}/rsa_pub.txt")
}

resource "aws_instance" "ec2" {
  ami = "ami-0453ec754f44f9a4a"
  instance_type = "t2.micro"
    tags = {
       Name ="priyannka"
      }

   provisioner "remote-exec" {
    inline = [ 
        "sudo yum install httpd -y",
        "sudo systemctl enable --now httpd",
        "echo '<h1> hello priyannka santoki </h1>' | sudo tee /var/www/html/index.html"
     ]
    }
  connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
   }

}