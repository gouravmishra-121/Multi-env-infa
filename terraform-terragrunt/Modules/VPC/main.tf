resource "aws_vpc" "vpc" {  
  cidr_block = var.cidr_block  
  tags = {  
    Name = "${var.environment}-vpc"  
  }  
}  

resource "aws_subnet" "subnet" {  
  vpc_id     = aws_vpc.vpc.id  
  cidr_block = "10.0.1.0/24"  
  tags = {  
    Name = "${var.environment}-subnet"  
  }  
}  
