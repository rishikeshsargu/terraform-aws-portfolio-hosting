This project uses Terraform to:

Create a VPC, Subnet, Internet Gateway, Route Table & Association

Create an EC2 instance (Ubuntu)

Configure a Security Group allowing SSH & HTTP

Attach an EBS Volume

Use file provisioners to upload local HTML/CSS files

Use remote-exec provisioners to install and configure Nginx

Deploy a static website automatically on the EC2 instance

Store Terraform remote state in an S3 backend

Fully automate the entire pipeline from infrastructure → deployment

├── main.tf               # All Terraform resources (VPC, EC2, SG, Subnet, etc.)
├── variables.tf          # Input variables
├── outputs.tf            # Output values (public IP, etc.)
├── nginx.sh              # Script to install nginx and deploy website
├── portfolio/            # Your local HTML/CSS website folder OR ZIP file
└── README.md             # Project documentation
