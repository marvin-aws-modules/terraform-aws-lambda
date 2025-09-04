terraform {
  required_version = ">= 1.3.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.5.0"
    }
    archive = {
      source  = "hashicorp/archive"
      version = "~> 2.3.0" # You can adjust this to the latest stable version
    }
  }
}
