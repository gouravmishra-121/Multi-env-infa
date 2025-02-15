terraform {  
  source = "../../../modules/vpc"  
}  

inputs = {  
  environment = "stage"  
  cidr_block  = "10.0.0.0/16"  
}  
