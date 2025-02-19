
resource "aws_instance" "test_server" {
  ami           = "ami-0c55b159cbfafe1f0" # Example AMI (adjust as needed)
  instance_type = "t2.micro"
  key_name      = "my-key"

  tags = {
    Name = "hello-kf-test-srv"
  }

  user_data = <<-EOF
    #!/bin/bash
    echo "hello-kf-test-srv" > /etc/hostname
    hostnamectl set-hostname hello-kf-test-srv
    echo "127.0.0.1 hello-kf-test-srv" >> /etc/hosts
  EOF
}
