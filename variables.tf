variable "region" {
  description = "The AWS region to deploy into"
  type        = string
  default     = "eu-west-2" # Update with your desired default region
}
variable "vpc_name" {
  description = "Name of the VPC"
}
variable "internet_gateway_name" {
  description = "Name of the internet gatway"
}
variable "vpc_cidr_block_value" {
  description = "values of the CIDR block of the VPC"
}
variable "public_subnets" {
  description = "Name of the public subnet"
}
variable "azs" {
  description = "Name of the availability zones"
}
variable "public_subnet_cidr" {
  description = "values of the CIDR block of the public subnets"
}
variable "private_subnets" {
  description = "Name of the private subnet"
}
variable "private_subnet_cidr" {
  description = "values of the CIDR block of the private subnets"
}
variable "public_route_table" {
  description = "Name of the public route table"
}
variable "private_route_table" {
  description = "Name of the private route table"
}
variable "environment" {
  type        = string
  description = "Name of the environment"
}
variable "ingress_service" {
  description = "List of inbound service ports for the security group"
  type        = list(number) # Define the type as a list of numbers for better validation
  default     = [80, 443, 8080, 22, 8443, 3306, 1900, 1443]
}
variable "amis" {
  description = "Value of the ami in their respective regions"
}
variable "instance_type" {
  description = "Type of the ec2 instance"
}
variable "key_name" {
  description = "value of the key"
}