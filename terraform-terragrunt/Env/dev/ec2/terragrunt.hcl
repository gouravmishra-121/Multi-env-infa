terraform {  
  source = "../../../modules/ec2"  
}  

inputs = {  
  environment   = "dev"  
  ami_id        = "ami-053a45fff0a704a47"  
  instance_type = "t2.micro"  
  subnet_id     = dependency.vpc.outputs.subnet_id  
}  

dependency "vpc" {  
  config_path = "../vpc"  
}  
