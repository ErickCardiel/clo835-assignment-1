provider "aws" {
  region = var.region
}


resource "aws_instance" "amazon_linux" {
  ami                         = data.aws_ami.latest_amazon_linux.id
  instance_type               = "t3.micro"
  key_name                    = aws_key_pair.my_key.key_name
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = data.terraform_remote_state.network_outputs.outputs.public_subnet_id
  associate_public_ip_address = true
  user_data                   = file("${path.module}/run_docker.sh")
  iam_instance_profile        = "LabInstanceProfile"
  tags = merge(var.default_tags,
    {
      "Name" = "host"
    }
  )
}


resource "aws_key_pair" "my_key" {
  key_name   = var.keypair_name
  public_key = file("/home/ec2-user/.ssh/${var.keypair_name}.pem.pub")
  tags       = var.default_tags
}


resource "aws_security_group" "sg" {
  name        = "clo835-assignment1_sg"
  description = "Allow SSH and inbound traffic from port 8081 to 8083"
  vpc_id      = data.terraform_remote_state.network_outputs.outputs.vpc_id

  ingress {
    description = "SSH from everywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Web Application Ports"
    from_port   = 8081
    to_port     = 8083
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.default_tags
}