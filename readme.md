# Terraform - getting started
Followed the YouTube video from GK at https://www.youtube.com/watch?v=5_DHR5wVVRo

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

# Create a VM using Terraform

1. Initialize terraform from terminal `terraform init`  It downloads required dependences.  There is a warning on provider version deprecation and needs to be removed later.
    

2. Terraform uses declaritive form.  So, we have script what is required and terraform figures out how to achieve it.  Ask terraform to identify the changes required.  It does that by comparing the current state (on project in google cloud) with what is declared in this project.  Execute `terraform plan` in terminal.  Plan shows all the changes required to achieve the required state. 

3. Execute `terraform apply` to apply the changes to the google cloud.  Once it completes go check on google console to ensure the requested changes have been applied.

4. Remove the environment by executing `terraform destroy` to apply the changes to the google cloud.  This will remove the environment and avoid incurring cost.

# Create a database using terraform.  Note that this is an extremely simple database and it is just for testing purpose

1. Follow usual steps for terraform (init and apply) to create database.  Note that it took about 11 minutes to create the database.

2. Login into cloud console, go to master-instance sql instance and reset the password for the user postgres

3. Open a cloud shell.  Create a table to check whether postgress is good.

``` sql
gcloud sql connect master-instance --user=postgres --quiet

\l

create teable employee(name varchar(255));

insert into employee (name) values ('satish');

select * from employee;

exit

```

4. Ensure to release the resources of testing.  The command is `terraform destroy`.  It took abut 3 mintues to release the cloud sql.
