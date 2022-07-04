
provider "aws" {
   region = var.region
 }


terraform {
  required_providers {
    aws = "~> 3.21"
  }
}