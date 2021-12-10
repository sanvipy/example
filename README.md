# Go example projects

[![Go Reference](https://pkg.go.dev/badge/golang.org/x/example.svg)](https://pkg.go.dev/golang.org/x/example)


Note:

This is a fork of golang/example, for the purpose of demonstrating a simple Jenkins pipeline. A Jenkins file is added in /hello 

1. It does 3 steps: build and package the app into zip, deploy an AWS lambda function and deploy the app into it

2. The pipeline pod utlizes 3 containers in total:  golang to build the app, zip to create a deployment package, terraform to deploy the app as an AWS lambda function 

3. Use a pipeline job with a choice field having option [apply, destroy] to utlize above Jenkinsfile

You will need a Jenkins running on a Kubernetes cluster and [this](https://github.com/sanvipy/eks-jenkins) will help you

## Using this

1. Use Pipeline from SCM and point to this repo. Jenkinsfile is located in /hello 

2.  Add a choic parameter with options [plan, apply, destroy]

