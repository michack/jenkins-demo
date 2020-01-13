# jenkins-demo

### Terraform:

```
cd terraform
```

```
terraform init
```

Configuration variables are set in vars/jenkins-demo.tfvars file.
If you want to connect to the instance via ssh then provide your ssh_public_key in jenkins-demo.tfvars file.

```
export AWS_ACCESS_KEY_ID="<AWS_ACCESS_KEY_ID>";
export AWS_SECRET_ACCESS_KEY="<AWS_SECRET_ACCESS_KEY>";
terraform plan -var-file=vars/jenkins-demo.tfvars
```

```
terraform apply -var-file=vars/jenkins-demo.tfvars
```

Public IP of the instnce will appear in output of terraform:

```
Apply complete! Resources: 14 added, 0 changed, 0 destroyed.

Outputs:

instance_public_ip = x.x.x.x
jenkins_endpoint = http://x.x.x.x:8080
sentry_endpoint = http://x.x.x.x:9000

```

Jenkins instance will be available in few minutes under: http://x.x.x.x:8080/. It needs another few minutes to create docker slave image. So please be patient!
Execute seed job first to create jobs. Once it is done execute general_builder job to create image.

Remove AWS resources:
```
terraform destroy -var-file=vars/jenkins-demo.tfvars
```


### Jenkins

Jenkins configuration is defined in jenkins.yaml file (Jenkins configuration as a code). It contains default user and password to access web interface.
