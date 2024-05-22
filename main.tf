# main.tf
provider "aws" {
  region = "us-east-1" # Change to your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Change to your desired AMI
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleInstance"
  }
}
