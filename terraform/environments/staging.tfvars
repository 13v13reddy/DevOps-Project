aws_region= "us-east-2"
name = "Staging-VPC"
vpc_cidr = "10.2.0.0/16"
pubsub_cidr = "10.2.1.0/24"
prisub1_cidr="10.2.2.0/24"
prisub2_cidr ="10.2.3.0/24"
availability_zone= "us-east-2a"
availability_zone2= "us-east-2b"
ami_id= "ami-04f7a54071e74f488" # Example AMI ID, replace with a valid one
instance_type= "t2.micro"
key_name= "Staging-server" # Replace with your key pair name
tags= {
    Environment = "Staging"
    Project     = "VPC"
  }
cluster_name = "Staging-EKS"
cluster_version= "1.29"

