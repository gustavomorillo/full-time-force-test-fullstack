# Provider Variable

variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = null
}

variable "security_group" {
  description = "security group elastic beanstalk"
  type        = string
  default     = null
}

variable "subnet_one" {
  description = "subnet one vpc"
  type        = string
  default     = null
}

variable "subnet_two" {
  description = "subnet two vpc"
  type        = string
  default     = null
}

variable "environment" {
  description = "environment to use (dev/prod/testing)"
  type        = string
  default     = null
}

##################################################################
#BACKEND NODE VARIABLES ELASTIC BEANSTALK
##################################################################

variable "instance_type_backend" {
  description = "EC2 Instnace Type"
  type        = string
  default     = "t3.micro"
}

variable "vpc_id" {
  description = "Vpc ID"
  type        = string
  default     = null
}

variable "vpc_cidr" {
  description = "Vpc Cidr"
  type        = string
  default     = null
}

variable "public_subnets_ids" {
  description = "List of public subnets"
  type        = list(string)
  default     = null
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type        = string
  default     = null
}

variable "app_name_node" {
  description = "name of the Application"
  type        = string
  default     = "full-time"
}

variable "description_app" {
  description = "description of the Application"
  type        = string
  default     = " Full time force test App"
}

variable "notification_email" {
  description = "Notification Email for monitoring purposes of backend node"
  type        = string
  default     = "gustavomorillo@gmail.com"
}

variable "elastic_beanstalk_tags" {
  description = "A mapping of tags to assign to elastic beanstalk nodejs resources"
  type        = map(string)
  default = {
    client : "Full Time Force"
  }
}

variable "BACKEND_DOMAIN" {
  description = "BACKEND_DOMAIN"
  type        = string
  default     = ""
}

variable "GIT_REPO_URL" {
  description = "GIT HUB REPO URL"
  type        = string
  default     = ""
}

variable "tags" {
  description = "A mapping of tags to assign to all resources"
  type        = map(string)
  default     = {}
}
