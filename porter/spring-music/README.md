# Run the Spring Music Service on Kubernetes and Digital Ocean PostgreSQL

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fendjin%2FCNAB.Quickstarts%2Fspring-music%2Fporter%2Fspring-music%2Fazuredeploy.json" target="_blank"><img src="https://raw.githubusercontent.com/endjin/CNAB.Quickstarts/master/images/Deploy-from-Azure.png"/></a>



## Parameters and Credentials

 | Name | Description | 
 | --- | --- | 
 | database_name | Name of database to create
do_access_token | Access Token for Digital Ocean Account
do_spaces_key | DO Spaces API Key
do_spaces_secret | DO Spaces API Secret
helm_release | Helm release name
kubeconfig | Kube config file with permissions to deploy app
namespace | Namespace to install Spring Music app
node_count | Number of database nodes
porter-debug | Print debug information from Porter when executing the bundle
region | Region to create Database and DO Space
space_name | Name for DO Space | 
