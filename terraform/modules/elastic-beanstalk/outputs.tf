

output "all_settings_EB" {
  description = "The id of the vpc"
  value       = aws_elastic_beanstalk_environment.backEndEnv.all_settings
}


output "cname" {
  description = "The cname dns"
  value       = aws_elastic_beanstalk_environment.backEndEnv.cname
}


output "instances_ID_EB" {
  description = "The id of instance"
  value       = aws_elastic_beanstalk_environment.backEndEnv.instances
}


data "aws_instances" "EB" {
  filter {
    name   = "instance-id"
    values = aws_elastic_beanstalk_environment.backEndEnv.instances
  }
}

output "instanceEB_IP" {
  description = "The ip of the instance"
  value       = data.aws_instances.EB.public_ips
}
