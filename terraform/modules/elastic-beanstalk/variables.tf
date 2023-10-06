# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instnace Type"
  type        = string
  default     = null
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key Pair that need to be associated with EC2 Instance"
  type        = string
  default     = null
}


variable "app_name" {
  description = "name of the Application"
  type        = string
  default     = null
}

variable "description" {
  description = "description of the Application"
  type        = string
  default     = null
}

variable "notification_email" {
  description = "Notification Email for monitoring purposes of backend node"
  type        = string
  default     = null
}

variable "tags" {
  description = "A mapping of tags to assign to vpc resources"
  type        = map(string)
  default     = {}
}

variable "vpc_cidr" {
  description = "Vpc cids"
  type        = string
  default     = null
}

variable "vpc_public_subnets_ids" {
  description = "vpc_public_subnets_ids"
  type        = any
  default     = null
}
variable "vpc_id" {
  description = "vpc_id"
  type        = string
  default     = null
}
variable "security_group" {
  description = "security group elastic beanstalk"
  type        = string
  default     = null
}
variable "BACKEND_DOMAIN_VAR" {
  description = "environment to use (dev/prod/testing)"
  type        = string
  default     = null
}

variable "GIT_REPO_URL" {
  description = "GIT HUB REPO URL"
  type        = string
  default     = ""
}
