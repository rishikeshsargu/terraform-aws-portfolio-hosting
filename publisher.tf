terraform {
  backend "s3" {
    bucket = "rishi0272"
    region = "ap-south-1"
    key = "project1/class.tfstate"
    use_lockfile = true #to resistrict to concurrent changes
  }


required_providers{
  aws={
    source = "hashicorp/aws"
    version  = " > 6.0 " #select the verion we want 
  }

}

}



provider "aws" {
    region = "ap-south-1"
  
}