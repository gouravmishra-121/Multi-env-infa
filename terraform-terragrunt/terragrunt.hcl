remote_state {  
  backend = "s3"  
  config = {  
    bucket         = "my-terragrunt-state-bucket"  
    region         = "us-east-1"  
  }  
}  
