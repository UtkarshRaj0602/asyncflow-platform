terraform {

  backend "s3" {

    bucket = "asyncflow-terraform-state"

    key = "stage/terraform.tfstate"

    region = "ap-south-1"

    encrypt = true

    # dynamodb_table = "asyncflow-terraform-lock"

  }

}
