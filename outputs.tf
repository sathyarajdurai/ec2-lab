output "ansible_server_ip" {
    values = [aws_eip.ansible_server_ip.id]
  
}