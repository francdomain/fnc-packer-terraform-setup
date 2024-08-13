region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

enable_dns_support = "true"

enable_dns_hostnames = "true"

preferred_number_of_public_subnets = 2

preferred_number_of_private_subnets = 4

environment = "dev"

ami-web = "ami-04de84d7edcd7e794"

ami-bastion = "ami-02bd6605c736696b4"

ami-nginx = "ami-01fee08ef8e0e3e45"

ami-sonar = "ami-0cc2b867d34e24f39"

ami = "ami-09e67e426f25ce0d7"

keypair = "my-ec2-key"

master-password = "devopspbl"

master-username = "francis"

account_no = "992382613070"

tags = {
  Owner-Email     = "francis4fnc@gmail.com"
  Managed-By      = "Terraform"
  Billing-Account = "1234567890"
}
