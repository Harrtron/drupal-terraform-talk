terraform plan

terraform apply -auto-approve \
-var "project_name=drupaltalk" \
-var "domain_name=bjsstestingaws.com" \
-var "aws_region=eu-west-1" \
-var "vpc_name=DEFAULT"