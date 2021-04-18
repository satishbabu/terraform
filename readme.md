# Terraform - getting started


## Terraform Installation & Setup:
1. Install terraform from Ubuntu on WSL. Get the link from browser by searching for terraform package

```linux
cd
wget https://releases.hashicorp.com/terraform/0.15.0/terraform_0.15.0_linux_amd64.zip
unzip terraform_*.zip
mv terraform bin
```

## Google Cloud setup
Create a service account in Google Cloud and download the key into tfsvc.com. 
Update project id in main.tf and adjust other parameters

## Terraform commands
1. Initialize terraform from terminal `terraform init`  It downloads required dependences.  There is a warning on provider version deprecation and needs to be removed later.
    

2. Terraform uses declaritive form.  So, we have script what is required and terraform figures out how to achieve it.  Ask terraform to identify the changes required.  It does that by comparing the current state (on project in google cloud) with what is declared in this project.  Execute `terraform plan` in terminal.  Plan shows all the changes required to achieve the required state. 

3. Execute `terraform apply` to apply the changes to the google cloud.  Once it completes go check on google console to ensure the requested changes have been applied.

