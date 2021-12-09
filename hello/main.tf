provider "aws" {
  region = "ap-southeast-1"    
  profile = "mdx-demo"          
}

terraform {
    backend "s3" {}  
}

// Lambda IAM role
resource "aws_iam_role" "lambda_role" {
  name = "hellogoFunctionRole"
  path = "/"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "sts:AssumeRole",
            "Principal": {
               "Service": "lambda.amazonaws.com"
            },
            "Effect": "Allow",
            "Sid": ""
        }
    ]
}
EOF
}

// Lambda function
resource "aws_lambda_function" "function" {
  filename      = "deployment.zip"
  function_name = "hello-go"
  role          = "${aws_iam_role.lambda_role.arn}"
  handler       = "main"
  runtime       = "go1.x"
}
