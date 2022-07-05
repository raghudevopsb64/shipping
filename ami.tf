provider "aws" {
  region = "us-east-1"
}

terraform {
  backend "s3" {
    bucket = "terraform-b64"
    key    = "ami/shipping/terraform.tfstate"
    region = "us-east-1"
  }
}

module "ami" {
  source      = "git::https://github.com/raghudevopsb64/tf-module-immutable-ami.git"
  COMPONENT   = "shipping"
  APP_VERSION = var.APP_VERSION
}

variable "APP_VERSION" {}
