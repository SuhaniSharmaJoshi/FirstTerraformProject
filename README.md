Terraform EC2 Instance Creation
This project demonstrates how to create an EC2 instance on AWS using Terraform. It covers the basic setup, configuration, and deployment of the instance.

Table of Contents
Prerequisites
Installation
Configuration
Usage
Outputs
Cleanup
License
Prerequisites
Before you begin, ensure you have the following:

An AWS account.
Terraform installed on your local machine. (Refer to the Terraform Installation Guide for instructions.)
AWS CLI installed and configured with your credentials. (Run aws configure to set it up.)
Installation
Clone this repository to your local machine:

bash
Copy
git clone https://github.com/YourUsername/FirstTerraformProject.git
cd FirstTerraformProject
Initialize Terraform:

bash
Copy
terraform init
Configuration
The main configuration file is main.tf. Here’s a brief overview of its contents:

Provider: Configures the AWS provider and specifies the region.
Resource: Defines an EC2 instance resource with the specified AMI and instance type.
Example Configuration
hcl
Copy
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe01e"  # Replace with your desired AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "MyFirstInstance"
  }
}
Usage
Plan the deployment to see what resources will be created:

bash
Copy
terraform plan
Apply the configuration to create the EC2 instance:

bash
Copy
terraform apply
Confirm the action by typing yes when prompted.

After the deployment, Terraform will output the instance ID and public IP address.

Outputs
The outputs of the deployment include:

Instance ID: The unique identifier for the EC2 instance.
Public IP: The public IP address assigned to the instance.
You can retrieve these values using:

bash
Copy
terraform output
Cleanup
To delete the resources created by Terraform, run:

bash
Copy
terraform destroy
Confirm the action by typing yes when prompted.
