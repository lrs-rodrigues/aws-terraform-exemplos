
provider "aws" {
   region = var.region
 }


terraform {
  required_version = ">= 0.12"
  
  required_providers {
    aws = "~> 4.20"
  }
}
