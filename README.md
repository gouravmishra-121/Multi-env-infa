
# **Terraform + Terragrunt Multi-Environment Project**

This project demonstrates how to use Terraform and Terragrunt to manage infrastructure across multiple environments (e.g., dev, staging, prod) in a DRY (Don’t Repeat Yourself) and scalable way.

## Project Structure

```plaintext
terraform-terragrunt-project/  
├── environments/  
│   ├── dev/  
│   │   ├── ec2/  
│   │   │   └── terragrunt.hcl  
│   │   └── vpc/  
│   │       └── terragrunt.hcl  
│   ├── staging/  
│   │   ├── ec2/  
│   │   │   └── terragrunt.hcl  
│   │   └── vpc/  
│   │       └── terragrunt.hcl  
│   └── prod/  
│       ├── ec2/  
│       │   └── terragrunt.hcl  
│       └── vpc/  
│           └── terragrunt.hcl  
├── modules/  
│   ├── ec2/  
│   │   ├── main.tf  
│   │   ├── variables.tf  
│   │   └── outputs.tf  
│   └── vpc/  
│       ├── main.tf  
│       ├── variables.tf  
│       └── outputs.tf  
├── terragrunt.hcl  
└── README.md  
```

## Key Features

- **Environment Isolation**: Each environment (dev, staging, prod) has its own configuration and state file.
- **Modular Design**: Infrastructure components (e.g., VPC, EC2) are defined as reusable Terraform modules.
- **Automated Initialization**: Terragrunt automatically runs `terraform init` and configures remote state.

## Prerequisites

- Terraform installed.
- Terragrunt installed.
- AWS CLI configured with valid credentials.
- S3 Bucket for remote state management (optional but recommended).

## How to Use

### 1. Clone the Repository

```sh
git clone https://github.com/your-repo/terraform-terragrunt-project.git  
cd terraform-terragrunt-project  
```

### 2. Deploy Infrastructure

Navigate to the environment and component folder, then run `terragrunt apply`.

**Example: Deploy VPC in Dev Environment**

```sh
cd environments/dev/vpc  
terragrunt apply  
```

**Example: Deploy EC2 in Staging Environment**

```sh
cd environments/staging/ec2  
terragrunt apply  
```

### 3. Destroy Infrastructure

To delete resources, run `terragrunt destroy` in the respective folder.

**Example: Destroy VPC in Prod Environment**

```sh
cd environments/prod/vpc  
terragrunt destroy  
```

## Environment-Specific Configuration

Each environment has its own `terragrunt.hcl` file where you can define environment-specific variables like CIDR blocks.

**Example: environments/dev/vpc/terragrunt.hcl**

```hcl
inputs = {  
    cidr_block = "10.1.0.0/16"  
    environment = "dev"  
}  
```

**Example: environments/staging/vpc/terragrunt.hcl**

```hcl
inputs = {  
    cidr_block = "10.2.0.0/16"  
    environment = "staging"  
}  
```

**Example: environments/prod/vpc/terragrunt.hcl**

```hcl
inputs = {  
    cidr_block = "10.3.0.0/16"  
    environment = "prod"  
}  
```

## Modules

The `modules/` directory contains reusable Terraform modules for infrastructure components:

- **VPC Module**: Creates a VPC and subnets.
- **EC2 Module**: Deploys an EC2 instance within the VPC.

## Remote State Management

Terragrunt automatically configures remote state using an S3 bucket and DynamoDB table for state locking.

**Example: Remote State Configuration**

```hcl
remote_state {  
    backend = "s3"  
    config = {  
        bucket         = "my-terragrunt-state-bucket"  
        key            = "${path_relative_to_include()}/terraform.tfstate"  
        region         = "us-east-1"  
        encrypt        = true  
        dynamodb_table = "my-lock-table"  
    }  
}  
```

## Benefits of Using Terragrunt

- **Environment Isolation**: Each environment has its own state file and configuration.
- **Modularity**: Reusable Terraform modules reduce duplication.
- **Automation**: Automates `terraform init`, remote state configuration, and dependency management.
- **Scalability**: Easily manage multiple environments and components.

## Contributing

Feel free to open issues or submit pull requests to improve this project.
