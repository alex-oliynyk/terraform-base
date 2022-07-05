#######################################
# Beanstalk application
#######################################
resource "aws_elastic_beanstalk_application" "sentrifugo" {
  name        = "sentrifugo"
  description = "Sentrifugo application"
}


#######################################
# Beanstalk application version
#######################################
resource "aws_elastic_beanstalk_application_version" "sentrifugo_latest" {
  name        = "sentrifugo-latest"
  application = aws_elastic_beanstalk_application.sentrifugo.name
  bucket      = aws_s3_bucket.sentrifugo_bucket.id
  key         = aws_s3_bucket_object.sentrifugo_object.id
}


#######################################
# Beanstalk Environment
#######################################
resource "aws_elastic_beanstalk_environment" "sentrifugo_environment" {
  name                = "sentrifugo-environment"
  application         = aws_elastic_beanstalk_application.sentrifugo.name
  solution_stack_name = "64bit Amazon Linux 2018.03 v2.9.21 running PHP 7.2"
  version_label       = aws_elastic_beanstalk_application_version.sentrifugo_latest.name

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "IamInstanceProfile"
    value = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "VPCId"
    value = aws_vpc.vpc_sentrifugo.id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "AssociatePublicIpAddress"
    value = "true"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "Subnets"
    value = aws_subnet.public_subnet.id
  }

  setting {
    namespace = "aws:ec2:vpc"
    name = "ELBSubnets"
    value = aws_subnet.public_subnet.id
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name = "InstanceType"
    value = "t2.micro"
  }
}