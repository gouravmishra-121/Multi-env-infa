terraform {  
  source = "../../../modules/vpc"  
}  

inputs = {  
  environment = "prod"  
  cidr_block  = "10.0.0.0/16"  
}  
