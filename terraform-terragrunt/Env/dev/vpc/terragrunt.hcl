terraform {  
  source = "../../../modules/vpc"  
}  

inputs = {  
  environment = "dev"  
  cidr_block  = "10.0.0.0/16"  
}  
