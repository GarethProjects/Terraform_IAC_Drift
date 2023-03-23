
terraform {
  backend "s3" {
    bucket = "demo-bucket-terraform1000"
    key = "terraformDemoDayN_Drift/tfstate.tfstate"
    region = "us-east-1"
  }
}
