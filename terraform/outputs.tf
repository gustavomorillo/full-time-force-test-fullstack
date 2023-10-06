

# output "all_settings_EB" {
#   description = "The id of the vpc"
#   value       = module.elastic_beanstalk.all_settings_EB
# }


output "cname" {
  description = "The cname dns"
  value       = lower(module.elastic_beanstalk.cname)
}


output "instances_ID_EB" {
  description = "The id of instance"
  value       = module.elastic_beanstalk.instances_ID_EB[0]
}


output "instanceEB_IP" {
  description = "The ip of the instance"
  value       = module.elastic_beanstalk.instanceEB_IP[0]
}
