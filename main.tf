terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

####################### VPC #########################

resource "aws_vpc" "VPC1" {
  cidr_block = "192.168.5.0/25"
  tags = {
      "name" = "vpc"
  }
}

################## Web Tier Subnet ##################

resource "aws_subnet" "Subnet_Web" {
  vpc_id     = aws_vpc.VPC1.id
  cidr_block = "192.168.5.0/27" 

  tags = {
    Name = "Subnet_Web"
  }
}

################## App Tier Subnet ##################

resource "aws_subnet" "Subnet_App" {
  vpc_id     = aws_vpc.VPC1.id
  cidr_block = "192.168.5.32/27" 
  tags = {
    Name = "Subnet_App"
  }
}

################## DB Tier Subnet ##################

resource "aws_subnet" "Subnet_DB" {
  vpc_id     = aws_vpc.VPC1.id
  cidr_block = "192.168.5.64/28" 

  tags = {
    Name = "Subnet_DB"
  }
}