resource "aws_instance" "ansible_server" {
  
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  # security group
  vpc_security_group_ids = [aws_security_group.ansible_server.id]
  # key-pair
  key_name = "talent-academy-lab"
  # subnet
  subnet_id = data.aws_subnet.public.id
  # EIP

  tags = {
    Name = "Ansible-Server"
  }
}

resource "aws_eip" "ansible_server_ip" {
  instance = aws_instance.ansible_server.id
  vpc      = true
}