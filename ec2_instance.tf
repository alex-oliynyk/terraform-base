#######################################
# EC2 instance
#######################################
resource "aws_instance" "base_instance" {
  ami           = "ami-02f3416038bdb17fb"
  instance_type = "t2.micro"

  network_interface {
    network_interface_id = aws_network_interface.base_instance_network_interface.id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}

resource "aws_network_interface" "base_instance_network_interface" {
  subnet_id   = aws_subnet.base_public_subnet_1.id
  private_ips = ["10.0.0.10"]
}