aws_region= "us-east-1"
name = "Test-VPC"
vpc_cidr = "10.1.0.0/16"
pubsub_cidr = "10.1.1.0/24"
prisub1_cidr="10.1.2.0/24"
prisub2_cidr ="10.1.3.0/24"
availability_zone= "us-east-1a"
availability_zone2= "us-east-1b"
ami_id= "ami-04f7a54071e74f488" # Example AMI ID, replace with a valid one
instance_type= "t2.micro"
key_name= "server" # Replace with your key pair name
tags= {
    Environment = "Test"
    Project     = "VPC"
  }
cluster_name = "Prod-EKS"
cluster_version= "1.29"

