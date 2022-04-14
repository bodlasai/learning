resource "aws_instance" "myec2" {
    ami = var.amiid
    instance_type=var.instnaceid
    user_data     = <<EOF
               #!/bin/bash
               sudo yum update -y
               sudo yum install docker -y
               sudo service docker start
               sudo service docker status
               sudo usermod -a -G docker ec2-user
   EOF
}
