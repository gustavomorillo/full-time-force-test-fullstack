

resource "aws_elastic_beanstalk_application" "backendNode" {
  name        = var.app_name
  description = var.description
  tags        = var.tags
}

resource "aws_elastic_beanstalk_environment" "backEndEnv" {
  name = "${var.app_name}Env"

  application         = var.app_name
  solution_stack_name = "64bit Amazon Linux 2 v5.8.5 running Node.js 18"
  tags                = var.tags
  depends_on = [
  aws_elastic_beanstalk_application.backendNode, aws_sns_topic.ElasticBeanstalkBackEndTopic]
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "ElasticBeanstalkAndManagedUpdatesRole"
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
    name      = "UpdateLevel"
    value     = "minor"
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "ManagedActionsEnabled"
    value     = "true"
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "PreferredStartTime"
    value     = "SAT:23:40"
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions"
    name      = "ServiceRoleForManagedUpdates"
    value     = "ElasticBeanstalkAndManagedUpdatesRole"
  }
  setting {
    namespace = "aws:elasticbeanstalk:managedactions:platformupdate"
    name      = "InstanceRefreshEnabled"
    value     = "true"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = var.instance_type
  }
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    value     = var.instance_keypair
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = var.vpc_id
  }
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = join(", ", var.vpc_public_subnets_ids)
  }
  setting {
    name      = "Notification Topic ARN"
    namespace = "aws:elasticbeanstalk:sns:topics"
    value     = aws_sns_topic.ElasticBeanstalkBackEndTopic.arn
  }
  setting {
    name      = "Notification Protocol"
    namespace = "aws:elasticbeanstalk:sns:topics"
    value     = "email"
  }
  setting {
    name      = "Notification Endpoint"
    namespace = "aws:elasticbeanstalk:sns:topics"
    value     = var.notification_email
  }
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "PORT"
    value     = "8080"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "BACKEND_DOMAIN"
    value     = var.BACKEND_DOMAIN_VAR
  }

    setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "GIT_REPO_URL"
    value     = var.GIT_REPO_URL
  }

  

    setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    value     = var.security_group

  }



}
########################################################################################
# SNS TOPIC
########################################################################################

resource "aws_sns_topic" "ElasticBeanstalkBackEndTopic" {
  name = "ElasticBeanstalkBackEndNotification-${var.app_name}"
  tags = var.tags
}
resource "aws_sns_topic_subscription" "email-target" {
  topic_arn = aws_sns_topic.ElasticBeanstalkBackEndTopic.arn
  protocol  = "email"
  endpoint  = var.notification_email
}




