This is test code for Technical Assignment Mastercard by Arnab Mukhopadhyay

Here there are 3 env:
    - dev
    - prod
    - test

and 4 aws resurces being used. Namely:
    - vpc
    - rds
    - efs
    - eks

it uses s3 and dynamodb for the backend.

testing using pytets and boto

CICD by git actions workflows for branch :
    - test for test env
    - prod for prod env
    - dev for dev env

each environment contains for 4 files:
    - main.tf ==> env specific resurces config
    - backend.tf ==> state and lock files
    - terraform.tfvars ==> Env variable
    - provides.tf ==> AWS config

Requirements for runing this code
1. terraform latest
2. AWS creds to be put in ~/.aws/credentials
3. python3

USAGE:

export ENV=dev # example for dev

make init

make plan

make apply

make destry

