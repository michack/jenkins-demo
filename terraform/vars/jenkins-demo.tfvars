env = {
   name           = "jenkins-demo"
   vpc_cidr       = "10.11.0.0/16"
   region         = "us-east-1"
   az             = "us-east-1a"
   key_name       = "jenkins-demo"
}

public_subnets = {
  az1 = "10.11.0.0/24"
}

instance_size  = "t3a.large"

ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8h9NXNdv2cuTkuWNgZnit/uKyMca9BPI8gpgMJM7z1vUYY1+VdYGaG53wqqP/wnwiHioJlS2bmW0YM65D4SnIfUg9WHYmQinXdRvPiZ6l5Ic2f7RTRjrEKf7ex9CAH01/iRHPdMr/rgLlCSh7DQhfGbcdP8cDifF/Y8JmFmOekhl6P6gNAbCnKt7X08m74CXeJ5n36Pg73M2EHi8707ZmYMT2DXuvy4YfNPcWAI5GNxobhMyU/wzQDW1b8YAZd1NrQOJeX3i6PNZrgmxWjEDygRIwwimzfUqAkrMMM4NCgD/3uzXTL2kCbVWk5PUIccHhn/geF0lBd42FarcFsN3f"
