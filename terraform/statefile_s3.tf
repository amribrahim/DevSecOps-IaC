terraform {

backend "s3" {

encrypt = true

bucket = "terraform-s3-master"

#dynamodb_table = "tflocktable"
region = "us-east-1"
key = "master.tfstate"

}

}
