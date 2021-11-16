# Shipa Terraform Provider e.g tprovider
An example of Shipa Terraform's Provider. In this example Terraform will spin up needed
Shipa objects and resources. You will need to have Terraform installed. 

## Example Docs
Can check out the [Shipa Documentation](https://learn.shipa.io/docs/terraform) around Teraform to learn more
about the structure and how to create each Shipa Object via Terraform.

## Shipa Cloud or On-Prem Wiring
Will need to grab your target and API key. 
* Target -> target.shipa.cloud. Head to Settings (click on user icon top right), then General. 
* API Key -> Leverage the Shipa CLI to create one and assign a role. [API Key Creation Doc](https://learn.shipa.io/docs/tokens) or show the default token.

## Run this Example
```
#Use default token for quick example.
shipa token show
#TF steps. Can use the .tfvars in this project. 
terraform init
terraform plan  -var-file="env/dist.tfvars"
terraform apply -var-file="env/dist.tfvars"
```

## More Info
This demo was given by Shipa at HashiTalks days. 
* https://www.youtube.com/watch?v=pznJCVJ5NB8

## To-Do
Creating a Shipa RBAC role specifically for this. WIP.
Will connect to default "shipa-team".
```
#https://learn.shipa.io/docs/tokens
shipa token create --team shipa-team --id tfprovidertoken
shipa role permission add tfsys cluster framework node app
shipa role assign tfsys tfprovidertoken 
```
